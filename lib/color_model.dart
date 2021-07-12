import 'dart:math';
import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green
  ];
  Color currentColor = Colors.red;

  void changeColor() {
    final randomIndex = Random().nextInt(4);
    currentColor = _colors[randomIndex];
    notifyListeners();
  }
}
