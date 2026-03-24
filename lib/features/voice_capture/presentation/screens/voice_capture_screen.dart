import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:lyric_flow/core/theme/app_colors.dart';
import 'package:lyric_flow/core/widgets/soft_card.dart';
import 'package:lyric_flow/core/widgets/option_pill.dart';
import 'package:lyric_flow/core/widgets/voice_waveform.dart';
import 'package:lyric_flow/core/widgets/wave_loader.dart';
import 'package:lyric_flow/core/widgets/record_button.dart';
import 'package:lyric_flow/core/navigation/app_router.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_bloc.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_event.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_state.dart';

import 'package:lyric_flow/core/config/app_settings.dart';

class VoiceCaptureScreen extends StatefulWidget {
  const VoiceCaptureScreen({super.key});

  @override
  State<VoiceCaptureScreen> createState() => _VoiceCaptureScreenState();
}

class _VoiceCaptureScreenState extends State<VoiceCaptureScreen> {
  final settings = AppSettings();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LyricsBloc, LyricsState>(
      listenWhen: (previous, current) {
        return current.maybeWhen(
          loaded: (_) => previous is Generating,
          error: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_) => context.push(AppRoutes.generatedLyrics),
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          ),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isRecording = state.maybeWhen(
          recording: (_) => true,
          orElse: () => false,
        );
        final isLoading = state.maybeWhen(
          transcribing: () => true,
          generating: () => true,
          orElse: () => false,
        );

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'My generations',
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            onPressed: () =>
                                context.push(AppRoutes.myGenerations),
                            icon: Icon(
                              Icons.library_music_outlined,
                              size: 26,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white70
                                  : AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Library',
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white60
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const _HeaderSection(),
                  const SizedBox(height: 12),
                  const _TitleSection(),
                  const SizedBox(height: 40),
                  Expanded(
                    flex: 5,
                    child: SoftCard(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const _RecordingTimer(),
                            const _RecordingStatusText(),
                            const SizedBox(height: 40),
                            
                            if (isLoading)
                              const WaveLoader()
                            else
                              _WaveformSection(isActive: isRecording),
                              
                            const SizedBox(height: 40),
                            _ControlHintText(isRecording: isRecording, isLoading: isLoading),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _LanguageSelectorSection(
                    selectedLanguages: settings.selectedLanguages,
                    onToggleLanguage: (lang) {
                      setState(() {
                        if (settings.selectedLanguages.contains(lang)) {
                          if (settings.selectedLanguages.length > 1) {
                            settings.selectedLanguages.remove(lang);
                          }
                        } else {
                          if (settings.selectedLanguages.length < 2) {
                            settings.selectedLanguages.add(lang);
                          } else {
                            // Replace first one if 2 already selected?
                            // Or just do nothing. Let's do nothing for now.
                          }
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  _MoodSelectorSection(
                    selectedMood: settings.selectedMood,
                    onMoodChanged: (mood) =>
                        setState(() => settings.selectedMood = mood),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: _CreatorModeCtaButton(),
                  ),
                  const SizedBox(height: 18),
                  _FooterControls(
                    isLoading: isLoading,
                    isRecording: isRecording,
                    onToggleRecording: () {
                      if (isRecording) {
                        context.read<LyricsBloc>().add(
                          LyricsEvent.stopRecording(
                            mood: settings.selectedMood,
                            languages: List<String>.from(
                              settings.selectedLanguages,
                            ),
                          ),
                        );
                      } else {
                        context.read<LyricsBloc>().add(
                          const LyricsEvent.startRecording(),
                        );
                      }
                    },
                    onReset: () => context.read<LyricsBloc>().add(
                      const LyricsEvent.reset(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
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

class _RecordingTimer extends StatelessWidget {
  const _RecordingTimer();

  @override
  Widget build(BuildContext context) {
    // In a real app, you might want a separate TimerBloc or local timer
    // For now, keeping it static or simplified
    return const Text(
      "00:00",
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
      ),
    );
  }
}

class _RecordingStatusText extends StatelessWidget {
  const _RecordingStatusText();

  @override
  Widget build(BuildContext context) {
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

class _WaveformSection extends StatelessWidget {
  final bool isActive;
  const _WaveformSection({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return VoiceWaveform(isActive: isActive);
  }
}

class _ControlHintText extends StatelessWidget {
  final bool isRecording;
  final bool isLoading;
  const _ControlHintText({required this.isRecording, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Opacity(
        opacity: 0.6,
        child: Text(
          "Processing your lyric...",
          style: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500),
        ),
      );
    }
    
    return Opacity(
      opacity: 0.6,
      child: Text(
        isRecording ? "Listening to your emotion..." : "Express your emotion",
        style: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _LanguageSelectorSection extends StatelessWidget {
  final List<String> selectedLanguages;
  final Function(String) onToggleLanguage;

  const _LanguageSelectorSection({
    required this.selectedLanguages,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final allLanguages = ["English", "Hindi", "Urdu", "Punjabi", "Spanish"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text.rich(
            TextSpan(
              style: GoogleFonts.beVietnamPro(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
              children: [
                const TextSpan(text: 'SELECT LANGUAGES '),
                TextSpan(
                  text: '(MAX 2)',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: allLanguages.map((lang) {
              final isSelected = selectedLanguages.contains(lang);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(lang),
                  selected: isSelected,
                  onSelected: (_) => onToggleLanguage(lang),
                  selectedColor: AppColors.primary.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? AppColors.primary
                        : (isDark ? Colors.white70 : Colors.black87),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  backgroundColor: isDark
                      ? AppColors.surfaceDark
                      : AppColors.surfaceLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _MoodSelectorSection extends StatelessWidget {
  final String selectedMood;
  final Function(String) onMoodChanged;

  const _MoodSelectorSection({
    required this.selectedMood,
    required this.onMoodChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                onTap: () => onMoodChanged(mood),
              ),
            ),
        ],
      ),
    );
  }
}

/// Full-width pill above the record control; opens Creator Mode.
class _CreatorModeCtaButton extends StatelessWidget {
  const _CreatorModeCtaButton();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: isDark ? 0.25 : 0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.push(AppRoutes.creatorMode),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withValues(alpha: isDark ? 0.22 : 0.14),
                  AppColors.primary.withValues(alpha: isDark ? 0.10 : 0.06),
                ],
              ),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.55),
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_fix_high_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'Creator mode',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.primary.withValues(alpha: 0.85),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterControls extends StatelessWidget {
  final bool isRecording;
  final bool isLoading;
  final VoidCallback onToggleRecording;
  final VoidCallback onReset;

  const _FooterControls({
    required this.isLoading,
    required this.isRecording,
    required this.onToggleRecording,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCircleBtn(context, Icons.close, "Clear", onTap: onReset),
        // const SizedBox(width: 32),
        RecordButton(isRecording: isRecording, onTap: onToggleRecording,isLoading: isLoading),
        // const SizedBox(width: 32),
        // _buildCircleBtn(
        //   context,
        //   Icons.refresh,
        //   "Settings",
        //   onTap: () => context.push(AppRoutes.creatorMode),
        // ),
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
            radius: 30,
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
