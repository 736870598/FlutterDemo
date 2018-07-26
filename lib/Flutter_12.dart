//https://blog.csdn.net/hekaiyou/article/details/53536851
import 'package:flutter/material.dart';

class CenterLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("中心对齐方式"),
      ),
      body: new Center(
        child: new Text("屏幕中心.."),
      ),
    );
  }

}