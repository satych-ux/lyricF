import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/soft_card.dart';
import '../../../../core/widgets/option_pill.dart';
import '../../../../core/widgets/voice_waveform.dart';
import '../../../../core/widgets/record_button.dart';
import '../../../../core/navigation/app_router.dart';
import '../providers/voice_capture_provider.dart';

class VoiceCaptureScreen extends ConsumerWidget {
  const VoiceCaptureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              // Header
              _HeaderSection(),
              SizedBox(height: 12),
              _TitleSection(),

              SizedBox(height: 40),

              // Main Card
              Expanded(
                flex: 3,
                child: SoftCard(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Timer - Isolated Rebuild
                        _RecordingTimer(),
                        _RecordingStatusText(),

                        const SizedBox(height: 40),

                        // Animated Waveform - Selective
                        _WaveformSection(),

                        const SizedBox(height: 40),

                        _ControlHintText(),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Controls
              _LanguageSelectorSection(),

              SizedBox(height: 16),

              _MoodSelectorSection(),

              Spacer(),

              // Footer Controls
              _FooterControls(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "AI LYRIC ASSISTANT",
        style: GoogleFonts.beVietnamPro(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "LyricFlow",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        Container(
          width: 100,
          height: 4,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _RecordingTimer extends ConsumerWidget {
  const _RecordingTimer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuilds when recordingSeconds changes (every second when recording)
    final seconds = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.recordingSeconds),
    );

    return Text(
      "00:${seconds.toString().padLeft(2, '0')}",
      style: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
    );
  }
}

class _RecordingStatusText extends ConsumerWidget {
  const _RecordingStatusText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      "Recording time",
      style: TextStyle(
        fontSize: 14,
        color: isDark
            ? AppColors.textSecondaryDark
            : AppColors.textSecondaryLight,
      ),
    );
  }
}

class _WaveformSection extends ConsumerWidget {
  const _WaveformSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.isRecording),
    );

    return VoiceWaveform(isActive: isRecording);
  }
}

class _ControlHintText extends ConsumerWidget {
  const _ControlHintText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.isRecording),
    );

    return Opacity(
      opacity: 0.6,
      child: Text(
        isRecording ? "Listening to your emotion..." : "Express your emotion",
        style: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _LanguageSelectorSection extends ConsumerWidget {
  const _LanguageSelectorSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.selectedLanguage),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.translate, color: AppColors.primary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LANGUAGE",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondaryLight,
                ),
              ),
              Text(
                language,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.expand_more, color: Colors.grey.withValues(alpha: 0.5)),
        ],
      ),
    );
  }
}

class _MoodSelectorSection extends ConsumerWidget {
  const _MoodSelectorSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMood = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.selectedMood),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var mood in [
            "Melancholy",
            "Upbeat",
            "Romantic",
            "Chill",
            "Aggressive",
          ])
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: OptionPill(
                label: mood,
                isSelected: selectedMood == mood,
                onTap: () => ref
                    .read(voiceCaptureNotifierProvider.notifier)
                    .setMood(mood),
              ),
            ),
        ],
      ),
    );
  }
}

class _FooterControls extends ConsumerWidget {
  const _FooterControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(
      voiceCaptureNotifierProvider.select((s) => s.isRecording),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircleBtn(
          context,
          Icons.close,
          "Clear",
          onTap: () => ref.read(voiceCaptureNotifierProvider.notifier).reset(),
        ),
        const SizedBox(width: 32),
        RecordButton(
          isRecording: isRecording,
          onTap: () {
            ref.read(voiceCaptureNotifierProvider.notifier).toggleRecording();
            if (isRecording) {
              // Navigate to lyrics on stop for demo
              context.push(AppRoutes.generatedLyrics);
            }
          },
        ),
        const SizedBox(width: 32),
        _buildCircleBtn(
          context,
          Icons.refresh,
          "Settings",
          onTap: () => context.push(AppRoutes.creatorMode),
        ),
      ],
    );
  }

  Widget _buildCircleBtn(
    BuildContext context,
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isDark
                ? AppColors.surfaceDark
                : AppColors.surfaceLight,
            foregroundColor: isDark ? Colors.white : Colors.black,
            child: Icon(icon, size: 20),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
