import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/size_manager.dart';
import 'package:flutter_application_1/src/style_manager.dart';

class ArticleViewer extends StatelessWidget {
  const ArticleViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeManager.large * 10,
        vertical: SizeManager.large,
      ),
      child: Column(
        children: [
          Image.asset('assets/image_profile.png', width: 200, height: 200),
          const Text(
            'Mohammad Javad Zhianpour',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Physics Student/Software Engineer',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "A 22-year-old Physics student at Ferdowsi University of Mashhad.",
            style: StyleManager.articleDescription,
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeManager.medium),
            child: const Text(
              "Physics taught me how to break down complex problems into smaller parts, and software showed me how to bring those solutions into the real world. Currently, my main focus is on my studies, but I am also looking for a remote role as a Flutter developer—a place where I can rely on an \"AI-assisted workflow\" to get things done faster and cleaner.",
              style: StyleManager.articleContent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/students.png', width: 200, height: 200),
              Image.asset('assets/students.png', width: 200, height: 200),
              Image.asset('assets/students.png', width: 200, height: 200),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: SizeManager.medium),
              child: Text(
                "My Approach to Work",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeManager.small),
            child: Text(
              "I am a person of time-consuming and complex tasks. If I am unfamiliar with a subject, I won't let it go until I have fully learned it. In team settings, I strive to deliver my part with the highest quality and the most precise details.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeManager.small),
            child: Text(
              "Things don't always have to be ideal. Sometimes at night, the work gets exhausting, and I close the laptop. But the next day, I am the first one to open the project and keep going. I believe that in teamwork, persistence and showing up consistently matter more than momentary talent.",
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: SizeManager.medium),
              child: Text(
                "Building Under Constraints",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeManager.small),
            child: Text(
              "One of my most valuable experiences was developing \"Quitifika\" (a habit-tracking app). I wrote the entire front-end and design of this app alone during a three-month period when the internet in Iran was completely shut down. To keep the project moving, I used local, cost-effective AI models. This experience taught me how to manage a project properly and bring it to completion even under severe constraints.",
            ),
          ),
        ],
      ),
    );
  }
}
