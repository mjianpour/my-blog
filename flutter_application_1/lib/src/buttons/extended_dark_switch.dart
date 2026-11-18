import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/size_manager.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeManager.topBarHeight,
      height: SizeManager.topBarHeight,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    );
  }
}
