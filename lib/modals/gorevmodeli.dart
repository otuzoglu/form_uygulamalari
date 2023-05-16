// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GorevModeli {
  int id;
  String baslik;
  DateTime tarih;
  String simge;

  GorevModeli(
      {required this.id,
      required this.baslik,
      required this.tarih,
      required this.simge});
}

Map<String, Icon> simge = {
  "Okul": Icon(
    Icons.school,
    color: Colors.red,
    size: 32,
  ),
  "Ev": Icon(
    Icons.home,
    color: Colors.green,
    size: 32,
  ),
  "Eğlence": Icon(
    Icons.videogame_asset,
    color: Colors.blueAccent,
    size: 32,
  ),
  "İş": Icon(
    Icons.work,
    color: Colors.blueAccent,
    size: 32,
  ),
};
