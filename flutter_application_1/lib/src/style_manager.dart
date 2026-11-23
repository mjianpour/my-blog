import 'package:flutter/material.dart';

class StyleManager {
  StyleManager._();

  static const darkHero = TextStyle(
    fontSize: 15,
    color: Color.fromARGB(255, 244, 244, 244),
    letterSpacing: 1,
  );
  static const darkHeroDesc = TextStyle(fontSize: 35, color: Colors.white);
  static const darkParagraph = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 214, 214, 214),
  );
  static const darkImage = TextStyle(fontSize: 16, color: Colors.white);
  static const darkCaption = TextStyle(fontSize: 16, color: Colors.white);
  static const darkHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight(600),
    color: Colors.white,
  );

  static const lightHero = TextStyle(
    fontSize: 15,
    color: Colors.black,
    letterSpacing: 1,
  );
  static const lightHeroDesc = TextStyle(fontSize: 35, color: Colors.black);
  static const lightParagraph = TextStyle(fontSize: 18, color: Colors.black);
  static const lightImage = TextStyle(fontSize: 16, color: Colors.black);
  static const lightCaption = TextStyle(fontSize: 16, color: Colors.black);
  static const lightHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight(600),
    color: Colors.black,
  );

  static const topBarTabLight = TextStyle(fontSize: 15, color: Colors.black);
  static const topBarTabDark = TextStyle(
    fontSize: 15,
    color: Color.fromARGB(255, 248, 248, 248),
  );
}
