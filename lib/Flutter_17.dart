//https://blog.csdn.net/hekaiyou/article/details/53818099
import 'package:flutter/material.dart';

class OpacityDrawDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("绘画效果之不透明度"),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.1,
          child: new Container(
            width: 250.0,
            height: 300.0,
            decoration: new BoxDecoration(
                color: const Color(0xff000000)
            ),
          ),),
      ),
    );
  }

}