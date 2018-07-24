//https://blog.csdn.net/hekaiyou/article/details/52914402
import 'package:flutter/material.dart';

void main() =>
    runApp(new MaterialApp(
      title: '我的应用',
      home: new MyScaffold(),
    ));

//    runApp(new Center(child: new Text("你好，好，你好", textDirection: TextDirection.ltr)));


class MyAppBar extends StatelessWidget{

  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.menu),
              tooltip: "导航菜单",
              onPressed: null),
          new Expanded(child: title),
          new IconButton(icon: new Icon(Icons.search),
              tooltip: "搜索",
              onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text('实例标题', style: Theme.of(context).primaryTextTheme.title,),
          ),
          new Expanded(
              child: new Center(
                child: new Text("---nihao----"),
              ))
        ],
      ),
    );
  }

}