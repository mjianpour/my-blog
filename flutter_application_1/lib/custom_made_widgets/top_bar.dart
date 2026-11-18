import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/language_switcher.dart';
import 'package:flutter_application_1/src/size_manager.dart';

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

class TopBarContainer extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(63)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Item 1: Resume (PDF)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.picture_as_pdf_rounded),
                    SizedBox(width: SizeManager.small),
                    if (!isCompact) const Text("Resume"),
                  ],
                ),

                // Item 2: Notes
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.note),
                    SizedBox(width: SizeManager.small),
                    if (!isCompact) const Text("Notes"),
                  ],
                ),

                // Item 3: Projects
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.code),
                    SizedBox(width: SizeManager.small),
                    if (!isCompact) const Text("Projects"),
                  ],
                ),

                // Item 4: Contact (was duplicated "My Resume" — changed)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.email),
                    SizedBox(width: SizeManager.small),
                    if (!isCompact) const Text("Contact"),
                  ],
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
