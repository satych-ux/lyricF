import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/option_pill.dart';
import '../providers/creator_provider.dart';

class CreatorModeScreen extends ConsumerWidget {
  const CreatorModeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // App Bar
            const _CreatorAppBar(),

            // Scrollable Settings
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
                children: [
                  // Master Toggle
                  const _MasterToggle(),

                  const SizedBox(height: 40),

                  // Rhyme Structure
                  const _RhymeStructureSection(),

                  const SizedBox(height: 32),

                  const Text(
                    "Complexity Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  // Custom Sliders - Isolated Rebuilds
                  const _MeterIntensitySlider(),

                  const SizedBox(height: 24),

                  const _MetaphorDensitySlider(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const _ApplySettingsButton(),
    );
  }
}

class _CreatorAppBar extends StatelessWidget {
  const _CreatorAppBar();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: isDark
                  ? Colors.white10
                  : Colors.black.withValues(alpha: 0.05),
              child: const Icon(Icons.close, size: 20, color: Colors.white),
            ),
          ),
          Text(
            "Creator Mode",
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => context.pop(),
            child: Text(
              "Done",
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MasterToggle extends ConsumerWidget {
  const _MasterToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(
      creatorNotifierProvider.select((s) => s.isCreatorModeEnabled),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
      ),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enable Creator Mode",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Unlock granular controls",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Switch.adaptive(
            value: isEnabled,
            onChanged: (v) =>
                ref.read(creatorNotifierProvider.notifier).toggleCreatorMode(v),
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class _RhymeStructureSection extends StatelessWidget {
  const _RhymeStructureSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rhyme Structure",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.format_quote, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OptionPill(label: "AABB", isSelected: true, onTap: () {}),
              const SizedBox(width: 12),
              OptionPill(label: "ABAB", onTap: () {}),
              const SizedBox(width: 12),
              OptionPill(label: "XAXA", onTap: () {}),
              const SizedBox(width: 12),
              OptionPill(label: "Free", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _MeterIntensitySlider extends ConsumerWidget {
  const _MeterIntensitySlider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      creatorNotifierProvider.select((s) => s.meterIntensity),
    );

    return _BaseSliderCard(
      title: "Meter Intensity",
      subtitle: "Strictness of rhythm",
      icon: Icons.graphic_eq,
      value: value,
      statusLabel: value > 0.7 ? "High" : "Normal",
      labels: const ["Relaxed", "Strict"],
      onChanged: (v) =>
          ref.read(creatorNotifierProvider.notifier).setMeterIntensity(v),
    );
  }
}

class _MetaphorDensitySlider extends ConsumerWidget {
  const _MetaphorDensitySlider();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      creatorNotifierProvider.select((s) => s.metaphorDensity),
    );

    return _BaseSliderCard(
      title: "Metaphor Density",
      subtitle: "Literal vs Abstract",
      icon: Icons.auto_awesome,
      value: value,
      statusLabel: value > 0.5 ? "Abstract" : "Literal",
      labels: const ["Literal", "Abstract"],
      isGradient: true,
      onChanged: (v) =>
          ref.read(creatorNotifierProvider.notifier).setMetaphorDensity(v),
    );
  }
}

class _BaseSliderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final double value;
  final String statusLabel;
  final List<String> labels;
  final Function(double) onChanged;
  final bool isGradient;

  const _BaseSliderCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.statusLabel,
    required this.labels,
    required this.onChanged,
    this.isGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: isDark
                    ? AppColors.backgroundDark
                    : AppColors.backgroundLight,
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                statusLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 16,
              activeTrackColor: isGradient ? null : AppColors.primary,
              inactiveTrackColor: isDark ? Colors.grey[800] : Colors.grey[200],
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 14,
                elevation: 4,
              ),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
            ),
            child: Slider(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels
                .map(
                  (l) => Text(
                    l,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ApplySettingsButton extends StatelessWidget {
  const _ApplySettingsButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () => context.pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textMainLight,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle),
              SizedBox(width: 8),
              Text(
                "Apply Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
