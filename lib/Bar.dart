import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';


//---------------------------36中使用-----------------
class Bar{
  final double height;

  Bar(this.height);

  static Bar lerp(Bar begin, Bar end, double t){
    return new Bar(lerpDouble(begin.height, end.height, t));
  }
}

class BarTween extends Tween<Bar>{
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) {
    return Bar.lerp(begin, end, t);
  }
}

class BarChartPainter extends CustomPainter {

  final Animation<Bar> animation;
  final double barWidth;

  BarChartPainter(Animation<Bar> animation, this.barWidth)
      : animation = animation, super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final bar = animation.value;
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    canvas.drawRect( new Rect.fromLTWH(
        size.width-barWidth/2.0,
        size.height-bar.height,
        barWidth,
        bar.height ),
        paint );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}