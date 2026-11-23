import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewers/project_viewer.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return const ProjectViewer();
  }
}
