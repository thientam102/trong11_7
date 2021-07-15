import 'package:flutter/material.dart';

class Card {
  String text;
  List<Color> cardBackground;
  String image;

  Card(this.text, this.cardBackground, this.image);
}

List<Card> cardmore = [
  new Card(
      "Call Doctor",
      [
        Color(0xffDEE0A5),
        Color(0xffE1E562),
      ],
      "assets/online_doctor.png"),
  new Card(
      "Blood Pressure",
      [
        Color(0xffb6d4fa),
        Color(0xff66b3ff),
      ],
      "assets/blood.png"),
  
  new Card(
      "BMI",
      [
        Color(0xffffe6ff),
        Color(0Xffff99ff),
      ],
      "assets/bmi.png"),
  new Card(
      "Meditation",
      [
        Color(0xffc2f0c2),
        Color(0xFF85e085),
      ],
      "assets/meditation_1.png"),
];
