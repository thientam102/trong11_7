import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  new BannerModel(
      "Blood Pressure",
      [
        Color(0xffb6d4fa),
        Color(0xff66b3ff),
      ],
      "assets/healthbmi.png"),
  new BannerModel(
      "Covid-19",
      [
        Color(0xffffd9b3),
        Color(0xffffbb99),
      ],
      "assets/covid.png"),
];
