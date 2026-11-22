import 'package:flutter/material.dart';
import 'package:flutter_application_1/articles_and_windows/my_resume.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/src/style_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleViewer extends ConsumerWidget {
  const ArticleViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        for (Map item in myResumeArticle)
          Component(item: item, ref: ref).buildComponent(),

        SizedBox(height: SizeManager.large),
      ],
    );
  }
}

class Component {
  final Map<dynamic, dynamic> item;
  final WidgetRef ref;

  Component({required this.item, required this.ref});

  Widget buildComponent() {
    final isDark = ref.watch(isDarkMode);
    switch (item["type"]) {
      case "Hero":
        return Padding(
          padding: const EdgeInsets.only(top: SizeManager.medium),
          child: Text(
            item["text"],
            style: isDark ? StyleManager.darkHero : StyleManager.lightHero,
          ),
        );
      case "Hero-Desc":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: SizeManager.large * 2),
          child: Text(
            item["text"],
            style: isDark
                ? StyleManager.darkHeroDesc
                : StyleManager.lightHeroDesc,
            textAlign: TextAlign.center,
          ),
        );
      case "Paragraph":
        return Padding(
          padding: const EdgeInsets.only(top: SizeManager.tiny),
          child: Text(
            item["text"],
            style: isDark
                ? StyleManager.darkParagraph
                : StyleManager.lightParagraph,
          ),
        );
      case "Image":
        return Padding(
          padding: const EdgeInsets.only(top: SizeManager.large),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(SizeManager.small),
            child: Image.asset(item["path"]),
          ),
        );
      case "Caption":
        return Padding(
          padding: const EdgeInsets.only(top: SizeManager.small),
          child: Center(
            child: Text(
              item["text"],
              style: isDark
                  ? StyleManager.darkCaption
                  : StyleManager.lightCaption,
              textAlign: TextAlign.center,
            ),
          ),
        );
      case "Header":
        return Padding(
          padding: const EdgeInsets.only(top: SizeManager.large),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item["text"],
              style: isDark
                  ? StyleManager.darkHeader
                  : StyleManager.lightHeader,
            ),
          ),
        );
      case "Image-Profile":
        return LayoutBuilder(
          builder: (context, constraints) {
            final imageProfileRadius = (constraints.maxWidth * 0.15).clamp(
              50.0,
              85.0,
            );
            return Padding(
              padding: EdgeInsets.only(top: SizeManager.large * 5),
              child: CircleAvatar(
                radius: imageProfileRadius,
                backgroundImage: AssetImage(item["path"]),
              ),
            );
          },
        );
      case "map-list":
        return Padding(
          padding: const EdgeInsets.only(
            top: SizeManager.medium,
            bottom: SizeManager.large * 2.5,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color.fromARGB(255, 0, 8, 14)
                  : const Color.fromARGB(255, 249, 249, 249),
              borderRadius: BorderRadius.circular(SizeManager.small),
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? const Color.fromARGB(255, 0, 5, 9)
                      : const Color.fromARGB(
                          255,
                          180,
                          180,
                          180,
                        ).withOpacity(0.25),
                  blurRadius: 10, // how soft the edge is
                  spreadRadius: 0, // how far it grows before blurring
                  offset: const Offset(
                    0,
                    SizeManager.tiny,
                  ), // x, y — shift the shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(SizeManager.small),
              child: Wrap(
                spacing: SizeManager.medium, // horizontal gap between items
                runSpacing: SizeManager.medium, // vertical gap between rows
                alignment: WrapAlignment.center,
                children: [
                  for (Map stackItem in item["stack"])
                    Column(
                      children: [
                        SizedBox(
                          width: SizeManager.stackTileSide,
                          height: SizeManager.stackTileSide,
                          child: SvgPicture.asset(
                            stackItem["icon"],
                            semanticsLabel: stackItem["name"],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink(); // required fallback
    }
  }
}
