//https://blog.csdn.net/hekaiyou/article/details/53768325
import 'package:flutter/material.dart';

class SizeLayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("强制大小"),
      ),
      body: new SizedBox(
        width: 250.0,
        height: 250.0,
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.lightBlueAccent[100]
          ),
        ),
      ),
    );
  }

}

class ScaleLayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("强制比例"),
      ),
      body: new AspectRatio(
        aspectRatio: 3.0/2.0,
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.lightBlueAccent[100]
          ),
        ),
      ),
    );
  }

}

class SizeScaleLayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("强制大小，比例"),
      ),
      body: new SizedBox(
        width: 300.0,
        height: 300.0,
        child: new AspectRatio(
          aspectRatio: 2.0/1.0,
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlueAccent[100]
            ),
          ),
        ),
      ),
    );
  }

}

class ScaleSizeLayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("强制大小，比例"),
      ),
      body: new AspectRatio(
        aspectRatio: 20.0/1.0,
        child: new SizedBox(
          width: 250.0,
          height: 250.0,
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlueAccent[100]
            ),
          ),
        ),
      ),
    );
  }

}