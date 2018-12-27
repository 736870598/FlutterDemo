//https://blog.csdn.net/hekaiyou/article/details/72625480


import 'dart:math';

import 'package:flutter/material.dart';
import 'BarChart.dart';

class TweenAnims extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "flutter TweenAnim",
      home: TweenAnimsPage(),
    );
  }
}

class TweenAnimsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TweenAnimsPageState();
  }
}

class _TweenAnimsPageState extends State<TweenAnimsPage> with TickerProviderStateMixin{
  
  final random = new Random();
  AnimationController animation;
  BarChartTween tween;
  
  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    tween = new BarChartTween(new BarChart.empty(), new BarChart.random(random));
    animation.forward();
  }
  
  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
  
  void changeData(){
    setState(() {
      tween = new BarChartTween(tween.evaluate(animation), new BarChart.random(random));
      animation.forward(from: 0);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200, 100),
          painter: new BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeData, child: new Icon(Icons.refresh),),
    );
  }
  
}