import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  new BannerModel(
      "HeartBeat",
      [
        Color(0xffffd6cc),
        Color(0xffff8080),
      ],
      "assets/heartbeat.png"),
  new BannerModel(
      "Covid-19",
      [
        Color(0xffffd9b3),
        Color(0xffffbb99),
      ],
      "assets/covid.png"),
];
