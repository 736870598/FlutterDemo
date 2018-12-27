//https://blog.csdn.net/hekaiyou/article/details/72259392

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';
import 'dart:ui' show lerpDouble;

//动画
class MyAnim extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter 动画",
      home: new MyAnimPage(),
    );
  }
}

class MyAnimPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAnimPageState();
  }
}

class _MyAnimPageState extends State<MyAnimPage> with TickerProviderStateMixin{

  final random = Random();
  int dataSet = 50;
  AnimationController animation;
  double startHeight;
  double currentHeight;
  double endHeight;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this
    )
    ..addListener((){
      setState(() {
        currentHeight = lerpDouble(startHeight, endHeight, animation.value);
      });
    });
    startHeight = 0;
    currentHeight = 0;
    endHeight = dataSet.toDouble();
    //开始向前运行这个动画（朝向最后）
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData(){
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomPaint(
        size: new Size(200,200),
        painter: new BarChartPainter(currentHeight),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),),
    );
  }
}

class BarChartPainter extends CustomPainter{

  static const double barWidth = 30;
  final double barHeight;

  BarChartPainter(this.barHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;

    canvas.drawRect(new Rect.fromLTWH(
        size.width-barWidth/2.0,
        size.height-barHeight,
        barWidth,
        barHeight
    ), paint);

  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    return barHeight != oldDelegate.barHeight;
  }
}

