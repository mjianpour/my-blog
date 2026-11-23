import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/color_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/src/size_manager.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);

    return GestureDetector(
      onTap: () {
        ref.read(isDarkMode.notifier).state = !isDark;
      },
      child: Container(
        width: SizeManager.topBarHeight,
        height: SizeManager.topBarHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? ColorManager.darkButtonBackground
              : ColorManager.lightButtonBackground,
        ),
        child: Center(
          child: Icon(
            isDark ? Icons.light_mode : Icons.nightlight_round,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
