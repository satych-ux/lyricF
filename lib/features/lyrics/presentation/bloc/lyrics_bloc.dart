import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyric_flow/core/config/app_settings.dart';
import 'package:lyric_flow/features/lyrics/domain/usecases/generate_lyrics_usecase.dart';
import 'package:lyric_flow/features/lyrics/domain/usecases/enhance_lyrics_usecase.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/voice_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/stt_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/repositories/saved_generations_repository.dart';
import 'package:lyric_flow/features/lyrics/domain/entities/lyrics_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyric_flow/core/debug/ai_debug_log.dart';
import 'lyrics_event.dart';
import 'lyrics_state.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState> {
  final GenerateLyricsUseCase generateLyricsUseCase;
  final EnhanceLyricsUseCase enhanceLyricsUseCase;
  final VoiceRepository voiceRepository;
  final STTRepository sttRepository;
  final SavedGenerationsRepository savedGenerationsRepository;
  final FirebaseAuth firebaseAuth;

  StreamSubscription? _amplitudeSubscription;

  /// Carries forward for Firestore saves (generate + enhance + reopen from library).
  String? _lastMood;
  String? _lastLanguageLabel;

  LyricsBloc({
    required this.generateLyricsUseCase,
    required this.enhanceLyricsUseCase,
    required this.voiceRepository,
    required this.sttRepository,
    required this.savedGenerationsRepository,
    required this.firebaseAuth,
  }) : super(const LyricsState.initial()) {
    on<StartRecording>(_onStartRecording);
    on<StopRecording>(_onStopRecording);
    on<UpdateAmplitude>(_onUpdateAmplitude);
    on<EnhanceLyrics>(_onEnhanceLyrics);
    on<OpenFromLibrary>(_onOpenFromLibrary);
    on<Reset>(_onReset);
  }

  Future<void> _persistGeneration(
    LyricsEntity lyrics, {
    String? enhancementType,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) return;
    final mood = _lastMood ?? 'Unknown';
    final language = _lastLanguageLabel ?? 'Unknown';
    try {
      await savedGenerationsRepository.saveGeneration(
        userId: user.uid,
        lyrics: lyrics,
        mood: mood,
        language: language,
        enhancementType: enhancementType,
      );
    } catch (e, st) {
      debugAiLog('Firestore saveGeneration failed: $e\n$st');
    }
  }

  Future<void> _onStartRecording(
    StartRecording event,
    Emitter<LyricsState> emit,
  ) async {
    final hasPermission = await voiceRepository.hasPermission();
    if (!hasPermission) {
      emit(const LyricsState.error("Microphone permission denied"));
      return;
    }

    emit(const LyricsState.recording());

    _amplitudeSubscription?.cancel();
    _amplitudeSubscription = voiceRepository.amplitudeStream.listen((amp) {
      add(LyricsEvent.updateAmplitude(amp));
    });

    await voiceRepository.startRecording();
  }

  void _onUpdateAmplitude(UpdateAmplitude event, Emitter<LyricsState> emit) {
    if (state is Recording) {
      emit(LyricsState.recording(amplitude: event.amplitude));
    }
  }

  Future<void> _onStopRecording(
    StopRecording event,
    Emitter<LyricsState> emit,
  ) async {
    _amplitudeSubscription?.cancel();
    final audioPath = await voiceRepository.stopRecording();

    if (audioPath == null) {
      emit(const LyricsState.error("Recording failed"));
      return;
    }

    emit(const LyricsState.transcribing());

    try {
      final text = await sttRepository.convertSpeechToText(audioPath);

      emit(const LyricsState.generating());

      final settings = AppSettings();
      final rhymeScheme =
          settings.isCreatorModeEnabled ? settings.selectedRhyme : null;
      final intensityLevel =
          settings.isCreatorModeEnabled ? settings.meterIntensity : null;

      debugAiLog(
        '[generate pipeline] After speech-to-text\n'
        '  transcribedText: $text\n'
        '  mood: ${event.mood}\n'
        '  languages: ${event.languages}\n'
        '  creatorModeEnabled: ${settings.isCreatorModeEnabled}\n'
        '  rhymeScheme: $rhymeScheme\n'
        '  intensityLevel (meter): $intensityLevel\n'
        '  selectedLanguages (settings): ${settings.selectedLanguages}',
      );

      final lyrics = await generateLyricsUseCase(
        text: text,
        mood: event.mood,
        languages: event.languages,
        rhymeScheme: rhymeScheme,
        intensityLevel: intensityLevel,
      );

      debugAiLog(
        '[generate pipeline] Parsed lyrics entity\n'
        '  score: ${lyrics.score}\n'
        '  verse1: ${lyrics.verse1}\n'
        '  chorus: ${lyrics.chorus}\n'
        '  verse2: ${lyrics.verse2}',
      );

      _lastMood = event.mood;
      _lastLanguageLabel = event.languages.join(' & ');

      emit(LyricsState.loaded(lyrics));
      await _persistGeneration(lyrics);
    } catch (e) {
      emit(LyricsState.error(e.toString()));
    }
  }

  Future<void> _onEnhanceLyrics(
    EnhanceLyrics event,
    Emitter<LyricsState> emit,
  ) async {
    final previousState = state;
    emit(LyricsState.enhancing(event.currentLyrics, event.enhancementType));

    try {
      debugAiLog(
        '[enhance pipeline] Request\n'
        '  enhancementType: ${event.enhancementType}\n'
        '  current verse1: ${event.currentLyrics.verse1}\n'
        '  current chorus: ${event.currentLyrics.chorus}\n'
        '  current verse2: ${event.currentLyrics.verse2}\n'
        '  current score: ${event.currentLyrics.score}',
      );
      final enhancedLyrics = await enhanceLyricsUseCase(
        currentLyrics: event.currentLyrics,
        enhancementType: event.enhancementType,
      );
      debugAiLog(
        '[enhance pipeline] Parsed result\n'
        '  score: ${enhancedLyrics.score}\n'
        '  verse1: ${enhancedLyrics.verse1}\n'
        '  chorus: ${enhancedLyrics.chorus}\n'
        '  verse2: ${enhancedLyrics.verse2}',
      );
      emit(LyricsState.loaded(enhancedLyrics));
      await _persistGeneration(
        enhancedLyrics,
        enhancementType: event.enhancementType,
      );
    } catch (e) {
      emit(LyricsState.error(e.toString()));
      if (previousState is Loaded) {
        emit(previousState);
      }
    }
  }

  void _onOpenFromLibrary(
    OpenFromLibrary event,
    Emitter<LyricsState> emit,
  ) {
    _lastMood = event.mood;
    _lastLanguageLabel = event.language;
    emit(LyricsState.loaded(event.lyrics));
  }

  void _onReset(Reset event, Emitter<LyricsState> emit) {
    emit(const LyricsState.initial());
  }

  @override
  Future<void> close() {
    _amplitudeSubscription?.cancel();
    voiceRepository.dispose();
    return super.close();
  }
}
