import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/size_manager.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key, required this.languageSwitcherWidth});

  final double languageSwitcherWidth;

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.languageSwitcherWidth,
      height: SizeManager.topBarHeight,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(SizeManager.topBarHeight / 2),
        ),
      ),
    );
  }
}
