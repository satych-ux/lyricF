import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A pill-shaped button for tags and options.
/// Provides visual feedback for selection states.
class OptionPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  const OptionPill({
    super.key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isSelected 
        ? AppColors.primary 
        : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight);
    final textColor = isSelected 
        ? Colors.white 
        : (isDark ? AppColors.textMainDark : AppColors.textMainLight);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
          border: isSelected 
            ? null 
            : Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          boxShadow: isSelected 
            ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4))] 
            : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: textColor),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
