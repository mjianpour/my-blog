import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewers/notes_viewer.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return const NotesViewer();
  }
}
