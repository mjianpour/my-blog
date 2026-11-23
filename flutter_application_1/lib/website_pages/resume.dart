import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/viewers/article_viewer.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = (constraints.maxWidth * 0.07).clamp(
          24.0,
          360.0,
        );
        if (constraints.maxWidth > SizeManager.smallScreenWidth) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding * 1.2,
              ),
              child: const ArticleViewer(),
            ),
          );
        } else if (constraints.maxWidth > SizeManager.largeScreenWidth) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding * 3.0),
            child: ArticleViewer(),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ArticleViewer(),
          );
        }
      },
    );
  }
}
