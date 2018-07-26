//https://blog.csdn.net/hekaiyou/article/details/53574768
import 'package:flutter/material.dart';

class AlignLayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('定位对齐方式'),
      ),
      body: new Stack(
        children: <Widget>[
          new Align(
            alignment: new FractionalOffset(0.0,0.0),
            child: new Image.network('http://up.qqjia.com/z/25/tu32710_10.jpg'),
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.network('http://up.qqjia.com/z/25/tu32710_11.jpg'),
          )
        ],
      ),
    );
  }

}