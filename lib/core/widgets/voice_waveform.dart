import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_colors.dart';

/// Animated waveform widget that responds to voice input simulation.
class VoiceWaveform extends StatelessWidget {
  final bool isActive;

  const VoiceWaveform({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(12, (index) {
          // Generate staggered heights
          double height = 15.0 + (index % 3) * 10;
          if (index == 5 || index == 6) height = 35;

          final bar = Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 6,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: isActive ? (index % 2 == 0 ? 1.0 : 0.6) : 0.3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          );

          if (!isActive) return bar;

          return bar
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleY(
                begin: 0.5,
                end: 1.2,
                duration: Duration(milliseconds: 600 + (index * 100)),
                curve: Curves.easeInOut,
              );
        }),
      ),
    );
  }
}
