import 'package:flutter/material.dart';
import 'dart:math';

class ColorPalette{

  final List<Color> _colors;

  ColorPalette(this._colors){
    assert(_colors.isNotEmpty);
  }

  static final ColorPalette primary = new ColorPalette(
    <Color>[
      Colors.blue[400],
      Colors.red[400],
      Colors.green[400],
      Colors.yellow[400],
      Colors.purple[400],
      Colors.orange[400],
      Colors.teal[400],
    ]
  );

  int get length => _colors.length;

  Color random(Random random) => _colors[random.nextInt(length)];

}

