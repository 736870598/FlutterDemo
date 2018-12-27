//https://blog.csdn.net/hekaiyou/article/details/72455993
//https://blog.csdn.net/hekaiyou/article/details/72455993

import 'dart:math';

import 'package:FlutterTest/Bar.dart';
import 'package:flutter/material.dart';

class TweenAnim extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter TweenAnim",
      home: TweenAnimPage(),
    );
  }
}

class TweenAnimPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TweenAnimPageState();
  }
}

class _TweenAnimPageState extends State<TweenAnimPage> with TickerProviderStateMixin{

  final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(duration: const Duration(milliseconds: 300),vsync: this);
    tween = BarTween(new Bar(0), new Bar(50));
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData(){
    setState(() {
      dataSet = random.nextInt(100);
      tween = BarTween(tween.evaluate(animation), Bar(100*random.nextDouble()));
      animation.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(100, 100),
          painter: new BarChartPainter(tween.animate(animation), 30),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

