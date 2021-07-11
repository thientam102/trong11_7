import 'package:flutter/material.dart';

class Card {
  String text;
  List<Color> cardBackground;
  String image;

  Card(this.text, this.cardBackground, this.image);
}

List<Card> cardmore = [
  new Card(
      "Meditation",
      [
        Color(0xffc2f0c2),
        Color(0xFF85e085),
      ],
      "assets/meditation_1.png"),
  new Card(
      "BMI",
      [
        Color(0xffffe6ff),
        Color(0Xffff99ff),
      ],
      "assets/medicine.png"),
  new Card(
      "Emergency call",
      [
        Color(0xffffd6cc),
        Color(0xffff8080),
      ],
      "assets/call_1.png"),
];
