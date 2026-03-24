import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lyrics_entity.dart';

part 'lyrics_event.freezed.dart';

@freezed
class LyricsEvent with _$LyricsEvent {
  const factory LyricsEvent.startRecording() = StartRecording;
  const factory LyricsEvent.stopRecording({
    required String mood,
    required List<String> languages,
  }) = StopRecording;
  const factory LyricsEvent.updateAmplitude(double amplitude) = UpdateAmplitude;
  const factory LyricsEvent.enhanceLyrics({
    required LyricsEntity currentLyrics,
    required String enhancementType,
  }) = EnhanceLyrics;
  const factory LyricsEvent.openFromLibrary({
    required LyricsEntity lyrics,
    required String mood,
    required String language,
  }) = OpenFromLibrary;
  const factory LyricsEvent.reset() = Reset;
}
