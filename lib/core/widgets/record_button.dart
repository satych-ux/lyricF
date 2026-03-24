import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lyric_flow/core/widgets/wave_loader.dart';
import '../theme/app_colors.dart';

/// The central record button with a pulsing animation.
class RecordButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isRecording;

  const RecordButton({
    super.key, 
    this.onTap, 
    this.isRecording = false, 
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [

            if (isLoading)
              const WaveLoader(),
            // Pulse Rings
            if (isRecording)
              Container(
                width: 80, height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2), 
                  shape: BoxShape.circle
                ),
              )
              .animate(onPlay: (c) => c.repeat())
              .scale(
                begin: const Offset(0.8, 0.8), 
                end: const Offset(1.2, 1.2), 
                duration: 1.seconds
              )
              .fadeOut(),
            
            // Main Button
            if (!isLoading)
            Container(
              width: 64, height: 64,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4), 
                    blurRadius: 20, 
                    offset: const Offset(0,8)
                  )
                ]
              ),
              child: Icon(
                isRecording ? Icons.stop_rounded : Icons.mic_none_rounded, 
                color: Colors.white, 
                size: 32
              ),
            ),
          ],
        ),
      ),
    );
  }
}
