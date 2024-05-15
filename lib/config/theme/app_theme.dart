import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }) : assert(selectedColor >= 0 , 'selectedColor must be greater than or equal to 0'),
        assert(selectedColor < colorList.length,
          'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
}