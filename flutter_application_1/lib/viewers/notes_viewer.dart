import 'package:flutter/material.dart';

class NotesViewer extends StatefulWidget {
  const NotesViewer({super.key});

  @override
  State<NotesViewer> createState() => _NotesViewerState();
}

class _NotesViewerState extends State<NotesViewer> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is a sample of my notes.");
  }
}
