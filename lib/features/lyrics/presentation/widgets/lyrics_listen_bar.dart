import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lyric_flow/core/config/elevenlabs_config.dart';
import 'package:lyric_flow/core/di/injection.dart' as di;
import 'package:lyric_flow/core/services/elevenlabs_tts_service.dart';
import 'package:lyric_flow/core/theme/app_colors.dart';
import 'package:lyric_flow/features/lyrics/domain/entities/lyrics_entity.dart';
import 'package:lyric_flow/features/lyrics/presentation/utils/lyrics_plain_text.dart';
import 'package:share_plus/share_plus.dart';

/// ElevenLabs TTS: English / Hindi voice + poetic-style [voice_settings] on the API.
class LyricsListenBar extends StatefulWidget {
  const LyricsListenBar({super.key, required this.lyrics});

  final LyricsEntity lyrics;

  @override
  State<LyricsListenBar> createState() => _LyricsListenBarState();
}

class _LyricsListenBarState extends State<LyricsListenBar> {
  final AudioPlayer _player = AudioPlayer();
  StreamSubscription<PlayerState>? _playerSub;

  bool _english = true;
  bool _loading = false;
  bool _playing = false;

  /// Last successful ElevenLabs MP3 (same bytes used for playback).
  Uint8List? _lastMp3Bytes;
  bool? _lastWasEnglish;

  @override
  void initState() {
    super.initState();
    _playerSub = _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed && mounted) {
        setState(() => _playing = false);
      }
    });
  }

  @override
  void didUpdateWidget(covariant LyricsListenBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.lyrics != oldWidget.lyrics) {
      setState(() {
        _lastMp3Bytes = null;
        _lastWasEnglish = null;
      });
    }
  }

  @override
  void dispose() {
    _playerSub?.cancel();
    unawaited(_player.dispose());
    super.dispose();
  }

  Future<void> _stop() async {
    await _player.stop();
    if (mounted) setState(() => _playing = false);
  }

  Future<void> _togglePlay() async {
    if (_playing) {
      await _stop();
      return;
    }

    if (!ElevenLabsConfig.hasApiKey) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Add your key: flutter run '
            '--dart-define=ELEVENLABS_API_KEY=your_key',
          ),
        ),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      final service = di.sl<ElevenLabsTtsService>();
      final text = lyricsAsTtsPlaybackText(
        widget.lyrics,
        ttsModelId: ElevenLabsConfig.ttsModelId,
      );
      final bytes = await service.synthesizePoeticRead(
        text: text,
        languageCode: _english ? 'en' : 'hi',
        useHindiVoice: !_english,
      );

      await _player.stop();
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.dataFromBytes(bytes, mimeType: 'audio/mpeg'),
        ),
      );
      await _player.play();
      if (mounted) {
        setState(() {
          _loading = false;
          _playing = true;
          _lastMp3Bytes = bytes;
          _lastWasEnglish = _english;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(elevenLabsPlaybackUserMessage(e)),
          ),
        );
      }
    }
  }

  void _setLanguage(bool english) {
    if (_english == english) return;
    setState(() {
      _english = english;
      _lastMp3Bytes = null;
      _lastWasEnglish = null;
    });
    if (_playing || _loading) {
      unawaited(_stop());
    }
  }

  Future<void> _exportMp3() async {
    final bytes = _lastMp3Bytes;
    if (bytes == null || !mounted) return;

    try {
      final lang = _lastWasEnglish == true ? 'en' : 'hi';
      final stamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final name = 'lyricflow_listen_${lang}_$stamp.mp3';
      final xFile = XFile.fromData(
        bytes,
        mimeType: 'audio/mpeg',
        name: name,
      );

      await Share.shareXFiles(
        [xFile],
        text: 'LyricFlow — listen preview',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Choose “Save to Files” (or Drive) in the share sheet to keep $name',
          ),
        ),
      );
    } on MissingPluginException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Share plugin not ready — fully restart the app after flutter run.',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Could not export: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Material(
        color: isDark
            ? AppColors.surfaceDark.withValues(alpha: 0.6)
            : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.2),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.headphones_rounded,
                color: AppColors.primary,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                'Listen',
                style: GoogleFonts.beVietnamPro(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: isDark ? Colors.white : AppColors.textMainLight,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    ChoiceChip(
                      label: Text(
                        'English',
                        style: GoogleFonts.beVietnamPro(fontSize: 12),
                      ),
                      selected: _english,
                      onSelected: (_) => _setLanguage(true),
                      selectedColor: AppColors.primary.withValues(alpha: 0.25),
                      labelStyle: TextStyle(
                        color: _english
                            ? AppColors.primary
                            : (isDark ? Colors.white70 : Colors.black87),
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.35),
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                    ChoiceChip(
                      label: Text(
                        'Hindi',
                        style: GoogleFonts.beVietnamPro(fontSize: 12),
                      ),
                      selected: !_english,
                      onSelected: (_) => _setLanguage(false),
                      selectedColor: AppColors.primary.withValues(alpha: 0.25),
                      labelStyle: TextStyle(
                        color: !_english
                            ? AppColors.primary
                            : (isDark ? Colors.white70 : Colors.black87),
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.35),
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              IconButton.filledTonal(
                tooltip: 'Export MP3',
                onPressed: (_lastMp3Bytes == null || _loading) ? null : _exportMp3,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary.withValues(alpha: isDark ? 0.2 : 0.12),
                  foregroundColor: AppColors.primary,
                ),
                icon: const Icon(Icons.download_rounded, size: 22),
              ),
              const SizedBox(width: 4),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _loading ? null : _togglePlay,
                child: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_playing ? Icons.stop_rounded : Icons.play_arrow_rounded, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            _playing ? 'Stop' : 'Play',
                            style: GoogleFonts.beVietnamPro(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
