//https://blog.csdn.net/hekaiyou/article/details/53204466
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常用控件之图片'),
      ),
      body: new Column(
        children: <Widget>[
          new Image.network(
            'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
            scale: 3.0,
          ),
          new Image.asset("images/flutter_img.jpg", scale: 3.0,),
        ],
      )
    );
  }

}

void main(){
  runApp(
    new MaterialApp(
      home: new ImageDemo(),
    )
  );
}