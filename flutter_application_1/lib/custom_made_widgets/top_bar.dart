import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/language_switcher.dart';
import 'package:flutter_application_1/providers/tab_provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/src/color_manager.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/src/style_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 600;
        final circleW = isCompact ? 0.0 : SizeManager.topBarHeight * 2;

        final available =
            (constraints.maxWidth - 2 * circleW - 2 * SizeManager.small).clamp(
              0.0,
              double.infinity,
            );

        final minWidth =
            (150.0 - SizeManager.topBarHeight - 2 * SizeManager.small).clamp(
              0.0,
              available * 0.8,
            );
        final safeMin = minWidth.clamp(0.0, 600.0);
        final width = available.clamp(safeMin, 600.0).toDouble();

        return TopBarContainer(
          width: width,
          languageSwitcherWidth: circleW,
          isCompact: isCompact,
        );
      },
    );
  }
}

class TopBarContainer extends ConsumerWidget {
  const TopBarContainer({
    super.key,
    required this.width,
    required this.languageSwitcherWidth,
    required this.isCompact,
  });

  final double width;
  final double languageSwitcherWidth;
  final bool isCompact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: languageSwitcherWidth,
          height: SizeManager.topBarHeight,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(SizeManager.topBarHeight / 2),
            ),
          ),
        ),
        SizedBox(width: SizeManager.small),
        SizedBox(
          width: width,
          height: SizeManager.topBarHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isDark ? ColorManager.darkButtonBackground : Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(63)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Item 1: Resume (PDF)
                GestureDetector(
                  onTap: () {
                    ref.read(tabIndex.notifier).state = 0;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.picture_as_pdf_rounded,
                        color: isDark
                            ? Color.fromARGB(255, 248, 248, 248)
                            : Colors.black,
                      ),
                      SizedBox(width: SizeManager.small),
                      if (!isCompact)
                        Text(
                          "Resume",
                          style: isDark
                              ? StyleManager.topBarTabDark
                              : StyleManager.topBarTabLight,
                        ),
                    ],
                  ),
                ),

                // Item 2: Notes
                GestureDetector(
                  onTap: () {
                    ref.read(tabIndex.notifier).state = 1;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.note,
                        color: isDark
                            ? Color.fromARGB(255, 248, 248, 248)
                            : Colors.black,
                      ),
                      SizedBox(width: SizeManager.small),
                      if (!isCompact)
                        Text(
                          "Notes",
                          style: isDark
                              ? StyleManager.topBarTabDark
                              : StyleManager.topBarTabLight,
                        ),
                    ],
                  ),
                ),

                // Item 3: Projects
                GestureDetector(
                  onTap: () {
                    ref.read(tabIndex.notifier).state = 2;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.code,
                        color: isDark
                            ? Color.fromARGB(255, 248, 248, 248)
                            : Colors.black,
                      ),
                      SizedBox(width: SizeManager.small),
                      if (!isCompact)
                        Text(
                          "Projects",
                          style: isDark
                              ? StyleManager.topBarTabDark
                              : StyleManager.topBarTabLight,
                        ),
                    ],
                  ),
                ),

                // Item 4: Contact (was duplicated "My Resume" — changed)
                GestureDetector(
                  onTap: () {
                    ref.read(tabIndex.notifier).state = 3;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.email,
                        color: isDark
                            ? Color.fromARGB(255, 248, 248, 248)
                            : Colors.black,
                      ),
                      SizedBox(width: SizeManager.small),
                      if (!isCompact)
                        Text(
                          "Contact Me",
                          style: isDark
                              ? StyleManager.topBarTabDark
                              : StyleManager.topBarTabLight,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: SizeManager.small),
        if (languageSwitcherWidth > 0)
          LanguageSwitcher(languageSwitcherWidth: languageSwitcherWidth),
      ],
    );
  }
}
