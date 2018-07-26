//https://blog.csdn.net/hekaiyou/article/details/53184720
import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Center center = new Center(
      child: new Container(
        width: 300.0,
        height: 400.0,
        decoration: new BoxDecoration(
          color: const Color(0xfffce5ed),
          border: new Border.all(
            color:  const Color(0xff6d9eeb),
            width: 8.0
          ),
        ),
        child: new Text("常用控件之容器",
          style: new TextStyle(
              color: Colors.amber,
              decoration: TextDecoration.none,
              fontSize: 30.0
          ),
        ),
      ),
    );
    return center;
  }
}

void main(){
  runApp(new MaterialApp(
    title: '常用控件' '之容器',
    home: new ContainerView(),
  ));
}