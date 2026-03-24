import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:lyric_flow/core/navigation/app_router.dart';
import 'package:lyric_flow/core/theme/app_colors.dart';
import 'package:lyric_flow/core/widgets/action_chip.dart';
import 'package:lyric_flow/core/widgets/lyric_section.dart';
import 'package:lyric_flow/features/lyrics/domain/entities/lyrics_entity.dart';
import 'package:lyric_flow/features/lyrics/presentation/utils/lyrics_plain_text.dart';
import 'package:lyric_flow/features/lyrics/presentation/widgets/lyrics_listen_bar.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_bloc.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_event.dart';
import 'package:lyric_flow/features/lyrics/presentation/bloc/lyrics_state.dart';
import 'package:share_plus/share_plus.dart';

/// Visible on light and dark app bars: soft primary tint + gold icons.
class _RoundToolbarIconButton extends StatelessWidget {
  const _RoundToolbarIconButton({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.iconSize = 20,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fill = AppColors.primary.withValues(alpha: isDark ? 0.24 : 0.16);
    final borderColor = AppColors.primary.withValues(
      alpha: isDark ? 0.55 : 0.42,
    );

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fill,
          border: Border.all(color: borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: iconSize, color: AppColors.primary),
      ),
    );
  }
}

class GeneratedLyricsScreen extends StatelessWidget {
  const GeneratedLyricsScreen({super.key});

  static Future<void> _copyLyrics(
    BuildContext context,
    LyricsEntity lyrics,
  ) async {
    final text = lyricsAsPlainText(lyrics);
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Lyrics copied to clipboard')));
  }

  static Future<void> _shareLyrics(
    BuildContext context,
    LyricsEntity lyrics,
  ) async {
    final text = lyricsAsPlainText(lyrics);
    try {
      await Share.share(text, subject: 'LyricFlow — generated lyrics');
    } on MissingPluginException {
      await Clipboard.setData(ClipboardData(text: text));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Share needs a full restart: stop the app, then run flutter run again. '
            'Lyrics copied — you can paste into any app.',
          ),
        ),
      );
    } catch (_) {
      await Clipboard.setData(ClipboardData(text: text));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open share. Lyrics copied to clipboard.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<LyricsBloc, LyricsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.backgroundDark
              : AppColors.backgroundLight,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: _RoundToolbarIconButton(
              tooltip: 'Back',
              icon: Icons.arrow_back_rounded,
              onPressed: () => context.pop(),
            ),
            title: Text(
              "Generated Lyrics",
              style: GoogleFonts.newsreader(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              _RoundToolbarIconButton(
                tooltip: 'My generations',
                icon: Icons.library_music_outlined,
                iconSize: 18,
                onPressed: () =>
                    context.pushReplacement(AppRoutes.myGenerations),
              ),
              _RoundToolbarIconButton(
                tooltip: 'Share',
                icon: Icons.ios_share,
                iconSize: 18,
                onPressed: () {
                  final lyrics = state.maybeWhen(
                    loaded: (l) => l,
                    enhancing: (l, _) => l,
                    orElse: () => null,
                  );
                  if (lyrics != null) {
                    _shareLyrics(context, lyrics);
                  }
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: state.when(
            initial: () =>
                const Center(child: Text("No lyrics generated yet.")),
            recording: (_) => const Center(child: Text("Recording...")),
            transcribing: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            generating: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            loaded: (lyrics) => _buildLyricsContent(context, lyrics),
            enhancing: (lyrics, type) => Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: _buildLyricsContent(context, lyrics),
                ),
                const Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
            error: (message) => Center(child: Text("Error: $message")),
          ),
        );
      },
    );
  }

  Widget _buildLyricsContent(BuildContext context, LyricsEntity lyrics) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark
        ? const Color(0xFF2A241C)
        : const Color(0xFFFFFEFC);
    final copyBg = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : const Color(0xFFF2F0EB);

    Widget copyChip() {
      return Material(
        color: copyBg,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => _copyLyrics(context, lyrics),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.copy, size: 15, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(
                  'Copy',
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.07),
                    blurRadius: 24,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        if (isDark)
                          Colors.white.withValues(alpha: 0.04)
                        else
                          Colors.white,
                        cardColor,
                        if (isDark)
                          cardColor
                        else
                          AppColors.textSecondaryLight.withValues(alpha: 0.03),
                      ],
                      stops: const [0.3, 0.15, 1.0],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: copyChip(),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LyricSection(
                                title: 'VERSE 1',
                                lines: lyrics.verse1.split('\n'),
                              ),
                              LyricSection(
                                title: 'CHORUS',
                                lines: lyrics.chorus.split('\n'),
                                isHighlight: true,
                              ),
                              LyricSection(
                                title: 'VERSE 2',
                                lines: lyrics.verse2.split('\n'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        LyricsListenBar(lyrics: lyrics),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                CustomActionChip(
                  icon: Icons.sentiment_satisfied,
                  label: 'Enhance Emotion',
                  onTap: () => context.read<LyricsBloc>().add(
                    LyricsEvent.enhanceLyrics(
                      currentLyrics: lyrics,
                      enhancementType: 'emotion',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CustomActionChip(
                  icon: Icons.auto_awesome,
                  label: 'Make Poetic',
                  onTap: () => context.read<LyricsBloc>().add(
                    LyricsEvent.enhanceLyrics(
                      currentLyrics: lyrics,
                      enhancementType: 'poetic',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                CustomActionChip(
                  icon: Icons.translate,
                  label: 'Urdu Touch',
                  onTap: () => context.read<LyricsBloc>().add(
                    LyricsEvent.enhanceLyrics(
                      currentLyrics: lyrics,
                      enhancementType: 'urdu',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.38),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => context.pop(),
                child: SizedBox(
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Refine with Voice',
                        style: GoogleFonts.beVietnamPro(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
