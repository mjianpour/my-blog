import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/buttons/language_switcher.dart';
import 'package:flutter_application_1/src/size_manager.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final circleW = constraints.maxWidth < 600
            ? 0.0
            : SizeManager.topBarHeight * 2;

        // Space actually available for the middle box (never negative).
        final available =
            (constraints.maxWidth - 2 * circleW - 2 * SizeManager.small).clamp(
              0.0,
              double.infinity,
            );

        // Desired minimum width, but never larger than `available`.
        final minWidth =
            (150.0 - SizeManager.topBarHeight - 2 * SizeManager.small).clamp(
              0.0,
              available * 0.8,
            );

        final width = available.clamp(minWidth, 600.0);
        return TopBarContainer(width: width, languageSwitcherWidth: circleW);
      },
    );
  }
}

class TopBarContainer extends StatelessWidget {
  const TopBarContainer({
    super.key,
    required this.width,
    required this.languageSwitcherWidth,
  });

  final double width;
  final double languageSwitcherWidth;

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
            borderRadius: const BorderRadius.all(
              Radius.circular(SizeManager.topBarHeight / 2),
            ),
          ),
        ),
        const SizedBox(width: SizeManager.small),
        SizedBox(
          width: width,
          height: SizeManager.topBarHeight,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(63)),
            ),
          ),
        ),
        const SizedBox(width: SizeManager.small),

        languageSwitcherWidth == 0.0
            ? const SizedBox(width: 0)
            : LanguageSwitcher(languageSwitcherWidth: languageSwitcherWidth),
      ],
    );
  }
}
