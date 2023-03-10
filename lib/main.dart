import 'package:flutter/material.dart';
import 'package:mu_card/startscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: 'CARD APP',
    theme: ThemeData(primarySwatch: Colors.cyan),
  ));
}

class MyApp extends StatelessWidget {
  //stateless widget class
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dashboard(); //return to statefullwidget of MyScreen class
  }

  static of(BuildContext context) {}
}
