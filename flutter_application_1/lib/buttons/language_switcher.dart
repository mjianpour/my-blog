import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/language_provider.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key, required this.languageSwitcherWidth});

  final double languageSwitcherWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglishMode = ref.watch(isEnglish);

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
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeManager.topBarHeight / 2),
          ),
        ),
        child: Center(
          child: Text(
            isCompact
                ? (isEnglishMode ? 'EN' : 'فا')
                : (isEnglishMode ? 'English' : 'فارسی'),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
