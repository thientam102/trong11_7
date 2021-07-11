import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CardModel {
  String text;
  int cardBackground;
  var cardIcon;

  CardModel(this.text, this.cardBackground, this.cardIcon);

  get cardImage => null;
}

List<CardModel> cards = [
  new CardModel("Meditation", 0xFFec407a, FlutterIcons.church_faw5s),
  new CardModel("Yoga", 0xFF5c6bc0, FlutterIcons.seat_individual_suite_mco), 
  new CardModel("Exercises", 0xFFfbc02d, FlutterIcons.running_faw5s),
  new CardModel("Reminder", 0xFF1565C0, FlutterIcons.clock_faw5),
  new CardModel("Emergency call", 0xFF2E7D32, FlutterIcons.call_out_sli),
];
