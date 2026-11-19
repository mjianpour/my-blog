import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewers/article_viewer.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return const ArticleViewer();
  }
}
