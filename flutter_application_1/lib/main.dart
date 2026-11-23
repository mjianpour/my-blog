import 'package:flutter/material.dart';
import 'package:flutter_application_1/buttons/extended_dark_switch.dart';
import 'package:flutter_application_1/buttons/language_switcher.dart';
import 'package:flutter_application_1/custom_made_widgets/top_bar.dart';
import 'package:flutter_application_1/providers/tab_provider.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/website_pages/contact_me.dart';
import 'package:flutter_application_1/website_pages/notes.dart';
import 'package:flutter_application_1/website_pages/projects.dart';
import 'package:flutter_application_1/website_pages/resume.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(tabIndex));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int target) {
    if (!_pageController.hasClients) return;
    if (_pageController.page?.round() == target) return;
    _pageController.jumpToPage(target);
  }

  @override
  Widget build(BuildContext context) {
    // Provider -> PageView (instant jump, no sliding)
    ref.listen<int>(tabIndex, (previous, next) {
      _goToPage(next);
    });

    final isDark = ref.watch(isDarkMode);
    return LayoutBuilder(
      builder: (context, constraints) {
        return MaterialApp(
          theme: isDark
              ? ThemeData(
                  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 6, 10),
                )
              : ThemeData(
                  scaffoldBackgroundColor: const Color.fromARGB(
                    255,
                    245,
                    245,
                    245,
                  ),
                ),
          home: Scaffold(
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        // PageView -> Provider (user swipes)
                        onPageChanged: (index) {
                          ref.read(tabIndex.notifier).state = index;
                        },
                        children: [
                          SingleChildScrollView(child: ResumePage()),
                          Notes(),
                          Projects(),
                          ContactMe(),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeManager.medium,
                        right: SizeManager.medium,
                        top: SizeManager.globalVerticalPadding,
                      ),
                      child: TopBar(),
                    ),
                    Expanded(child: Container(height: double.infinity)),
                    constraints.maxWidth < SizeManager.smallScreenWidth
                        ? Row(
                            children: [
                              Expanded(
                                child: Container(width: double.infinity),
                              ),
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
                              Expanded(
                                child: Container(width: double.infinity),
                              ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
