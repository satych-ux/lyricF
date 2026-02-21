import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

/// A segment of lyrics (Verse, Chorus, etc.) with specific formatting.
class LyricSection extends StatelessWidget {
  final String title;
  final List<String> lines;
  final bool isHighlight;

  const LyricSection({
    super.key,
    required this.title, 
    required this.lines, 
    this.isHighlight = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: isHighlight ? const EdgeInsets.only(left: 16) : null,
      decoration: isHighlight ? BoxDecoration(
        border: Border(left: BorderSide(color: AppColors.primary.withValues(alpha: 0.5), width: 3))
      ) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 8),
          ...lines.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              line,
              style: GoogleFonts.newsreader(
                fontSize: isHighlight ? 22 : 20,
                height: 1.4,
                fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w500,
                fontStyle: isHighlight ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
