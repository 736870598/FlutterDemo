import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
//import 'color_palette.dart';

//-------------------------37中使用--------------


class BarChart {
  static const int barCount = 5;
  final List<Bar> bars;

  BarChart(this.bars){
    assert (bars.length == barCount);
  }

  factory BarChart.empty(){
    return new BarChart(
        new List.filled(barCount, new Bar(0, Colors.transparent))
    );
  }

  factory BarChart.random(Random random){
//    final Color color = ColorPalette.primary.random(random);
    final Color color = Colors.red;
    return new BarChart(
        new List.generate(barCount,
                (i) => new Bar(random.nextDouble()*100, color))
    );
  }

  static BarChart lerp(BarChart begin, BarChart end, double t){
    return new BarChart(
        new List.generate(barCount,
                (i) => Bar.lerp(begin.bars[i], end.bars[i], t))
    );
  }
}

class BarChartTween extends Tween<BarChart>{

  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);

  @override
  BarChart lerp(double t) {
    return BarChart.lerp(begin, end, t);
  }
}

class Bar {
  Bar(this.height, this.color);
  final double height;
  final Color color;
  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar( lerpDouble(begin.height, end.height, t), Color.lerp(begin.color, end.color, t) );
  }
}

class BarChartPainter extends CustomPainter{
  static const barWidthFraction = 0.75;

  final Animation<BarChart> animation;

  BarChartPainter(Animation<BarChart> animation):
        animation = animation,
        super(repaint: animation);


  @override
  void paint(Canvas canvas, Size size) {
    void drawBar(Bar bar, double x, double width, Paint paint){
      paint.color = bar.color;
      canvas.drawRect(
        new Rect.fromLTWH(x, size.height - bar.height, width, bar.height)
      , paint);
    }

    final paint = Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    //  每个条形占用的空间宽度
    final barDistance = size.width/(1+chart.bars.length);
    // 每个条形占用空间75%的宽度
    final barWidth = barDistance * barWidthFraction;
    // 用于计算每个条形的x坐标点
    var x = barDistance - barWidth/2;
    for (var bar in chart.bars){
      drawBar(bar, x, barWidth, paint);
      x+=barDistance;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}