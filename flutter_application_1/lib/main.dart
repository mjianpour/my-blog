import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/buttons/extended_dark_switch.dart';
import 'package:flutter_application_1/src/buttons/language_switcher.dart';
import 'package:flutter_application_1/src/custom_made_widgets/top_bar.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: SizeManager.globalVerticalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeManager.medium,
                    ),
                    child: TopBar(),
                  ),
                  Expanded(child: Container(height: double.infinity)),

                  constraints.maxWidth < SizeManager.smallScreenWidth
                      ? Row(
                          children: [
                            Expanded(child: Container(width: double.infinity)),
                            LanguageSwitcher(
                              languageSwitcherWidth: SizeManager.topBarHeight,
                            ),
                            SizedBox(width: SizeManager.small),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: SizeManager.globalVerticalPadding,
                                right: SizeManager.globalVerticalPadding,
                                bottom: SizeManager.globalVerticalPadding,
                              ),
                              child: DarkModeSwitch(),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: Container(width: double.infinity)),
                            Padding(
                              padding: const EdgeInsets.all(
                                SizeManager.globalVerticalPadding * 1.5,
                              ),
                              child: const DarkModeSwitch(),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
