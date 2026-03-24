import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lyric_flow/core/theme/app_colors.dart';

class WaveLoader extends StatelessWidget {
  const WaveLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 15.0,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .scaleY(
                begin: 1.0,
                end: 2.5,
                duration: 400.ms,
                delay: (index * 100).ms,
                curve: Curves.easeInOutSine,
              )
              .fade(
                begin: 0.5,
                end: 1.0,
                duration: 400.ms,
                delay: (index * 100).ms,
              );
        }),
      ),
    );
  }
}
