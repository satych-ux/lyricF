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
      margin: const EdgeInsets.only(bottom: 28),
      padding: isHighlight ? const EdgeInsets.only(left: 16) : null,
      decoration: isHighlight
          ? BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.65),
                  width: 3,
                ),
              ),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.beVietnamPro(
              color: AppColors.primary,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          ...lines.map((line) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              line,
              style: GoogleFonts.newsreader(
                fontSize: isHighlight ? 21 : 19,
                height: 1.45,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFFF8F5E6)
                    : AppColors.textMainLight,
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
