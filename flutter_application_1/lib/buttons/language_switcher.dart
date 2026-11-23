import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/language_provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/src/color_manager.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/src/style_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key, required this.languageSwitcherWidth});

  final double languageSwitcherWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglishMode = ref.watch(isEnglish);
    final isDark = ref.watch(isDarkMode);

    // Compact when the caller passes a single topBarHeight-sized pill.
    final isCompact = languageSwitcherWidth <= SizeManager.topBarHeight * 1.1;

    return GestureDetector(
      onTap: () {
        ref.read(isEnglish.notifier).state = !isEnglishMode;
      },
      child: Container(
        width: languageSwitcherWidth,
        height: SizeManager.topBarHeight,
        decoration: BoxDecoration(
          color: isDark
              ? ColorManager.darkButtonBackground
              : ColorManager.lightButtonBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeManager.topBarHeight / 2),
          ),
        ),
        child: Center(
          child: Text(
            isCompact
                ? (isEnglishMode ? 'EN' : 'FA')
                : (isEnglishMode ? 'English' : 'Persian'),
            style: isDark
                ? StyleManager.topBarTabDark
                : StyleManager.topBarTabLight,
          ),
        ),
      ),
    );
  }
}
