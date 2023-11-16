import 'package:flutter/material.dart';

const List<Color> _listColorPrivate = [
  Color(0xff071952),
  Color(0xffA076F9),
  Color(0xffFF0060),
  Color(0xffFF8400),
  Color(0xffFC2947),
  Color(0xff54B435),
  Color(0xff400D51),
  Color(0xffF7EC09),
  Color(0xff590696),
  Color(0xffFF8D29),
];

class AppTheme {
  int colorSelected;
  AppTheme({
    required this.colorSelected,
  });

  ThemeData theme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _listColorPrivate[colorSelected],
      );
}
