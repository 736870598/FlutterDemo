//https://blog.csdn.net/hekaiyou/article/details/53897967
import 'package:flutter/material.dart';

class MenusDemo extends StatefulWidget{
  @override
  _MenusDemoState createState() {
    return new _MenusDemoState();
  }

}

class _MenusDemoState  extends State<MenusDemo>{

  String _bodyStr = "显示菜单的点击事件";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("质感设计之弹出菜单"),
        actions: <Widget>[
          new PopupMenuButton<String> (
              onSelected: (String value){
                setState((){
                  _bodyStr = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem(
                    value: '选项一的值',
                    child: new Text("选项1")),
                new PopupMenuItem(
                    value: '选项二的值',
                    child: new Text("选项2")),
              ]
          )
        ],
      ),
      body: new Center(
        child: new Text(_bodyStr),
      ),
    );
  }


}