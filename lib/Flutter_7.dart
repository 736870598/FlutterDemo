//https://blog.csdn.net/hekaiyou/article/details/53189922
import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("常用控件之文本"),
      ),
      body: new Column(
        children: <Widget>[
          new Text(
            "红色+黑色删除线+25号",
            style: new TextStyle(
              color: const Color(0xffff0000),           //红色
              decoration: TextDecoration.lineThrough,   //删除线
              decorationColor: const Color(0xff000000), //黑色
              fontSize: 25.0,                           //25号
            )
          ),
          new Text(
            "橙色+下划线+24号",
            style: new TextStyle(
              color: const Color(0xffff9900),         //橙色
              decoration: TextDecoration.underline,   //下划线
              fontSize: 24.0,                         //24号
            ),
          ),
          new Text(
            "虚线上划线+23号+斜体",
            style: new TextStyle(
              decoration: TextDecoration.overline,            //上划线
              decorationStyle: TextDecorationStyle.dashed,    //虚线
              fontSize: 23.0,                                 //23号
              fontStyle: FontStyle.italic                     //斜体
            ),
          ),
          new Text(
            "serif字体+24号",
            style: new TextStyle(
              fontFamily: 'serif',            //serif字体
              fontSize: 24.0,                 //24号
            ),
          ),
          new Text(
            "monospace字体+24号+加粗",
            style: new TextStyle(
              fontFamily: "monospace",        //monospace字体
              fontSize: 24.0,                 //24号
              fontWeight: FontWeight.bold,    //加粗
            ),
          ),
          new Text(
            "天蓝色+25号+2行跨度",
            style: new TextStyle(
              color: const Color(0xff4a86e8),   //天蓝色
              fontSize: 25.0,                   //25号
              height: 2.0,                      //2行跨度
            ),
          ),
          new Text(
            "24号+2个字母间隔",
            style: new TextStyle(
              fontSize: 24.0,       //24号
              letterSpacing: 2.0,   //2个字母间隔
            ),
          ),
        ],
      ),
    );
  }
  
}

void main(){
  runApp(
    new MaterialApp(
      home: new ContainerText(),
    )
  );
}
