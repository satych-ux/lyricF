import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/action_chip.dart';
import '../../../../core/widgets/lyric_section.dart';
import '../providers/lyrics_provider.dart';

class GeneratedLyricsScreen extends ConsumerWidget {
  const GeneratedLyricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lyricsAsync = ref.watch(lyricsNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: isDark ? Colors.white10 : Colors.white60,
            child: const Icon(Icons.arrow_back, size: 20),
          ),
          onPressed: () => context.pop(),
        ),
        title: Text("Generated Lyrics", style: GoogleFonts.newsreader(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: isDark ? Colors.white10 : Colors.white60,
              child: const Icon(Icons.ios_share, size: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: lyricsAsync.when(
        data: (lyrics) => Column(
          children: [
            // Paper-like Card
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2A241C) : const Color(0xFFFFFEFC),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    )
                  ],
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                ),
                child: Stack(
                  children: [
                    // Gradient Overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                               isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
                               Colors.transparent,
                               isDark ? Colors.transparent : AppColors.primary.withValues(alpha: 0.05),
                            ]
                          )
                        ),
                      ),
                    ),
                    
                    // Copy Button
                    Positioned(
                      top: 16, right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.black26 : const Color(0xFFF2F0EB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.copy, size: 14, color: AppColors.primary),
                            SizedBox(width: 4),
                            Text("Copy", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary)),
                          ],
                        ),
                      ),
                    ),

                    // Lyrics Content
                    ListView.builder(
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                      itemCount: lyrics.sections.length,
                      itemBuilder: (context, index) {
                        final section = lyrics.sections[index];
                        return LyricSection(
                          title: section.title,
                          lines: section.lines,
                          isHighlight: section.isHighlight,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Controls
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomActionChip(
                          icon: Icons.sentiment_satisfied, 
                          label: "Enhance Emotion",
                          onTap: () => ref.read(lyricsNotifierProvider.notifier).enhanceEmotion(),
                        ),
                        const SizedBox(width: 12),
                        CustomActionChip(
                          icon: Icons.auto_awesome, 
                          label: "Make Poetic",
                          onTap: () => ref.read(lyricsNotifierProvider.notifier).makePoetic(),
                        ),
                        const SizedBox(width: 12),
                        const CustomActionChip(icon: Icons.translate, label: "Urdu Touch"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Voice Refine Button
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: double.infinity,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 8))
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                            child: const Icon(Icons.mic, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "Refine with Voice",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
