//https://blog.csdn.net/hekaiyou/article/details/52999238
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new TutorialHome(),
  ));
//  runApp
}

class TutorialHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "导航菜单",
            onPressed: null),
        title: new Text("质感设计"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "search",
              onPressed: null)
        ],
      ),
      body: new Center(
        child: new Text("nihao,nihao"),

      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "增加",
          child: new Icon(Icons.add),
          onPressed: null),
    );
  }

}