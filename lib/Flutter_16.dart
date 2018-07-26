//https://blog.csdn.net/hekaiyou/article/details/53818099
import 'package:flutter/material.dart';

class DecorationDrawDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("绘画效果之装饰容器"),
      ),
      body: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: const FractionalOffset(0.0,0.0),
              end: const FractionalOffset(1.0,1.0),
              colors: <Color>[const Color(0xffff2cc), const Color(0xffff6eb4)]),
        ),
        child: new Container(
          width: 250.0,
          height: 250.0,
        ),
      ),
    );
  }

}