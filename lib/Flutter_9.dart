//https://blog.csdn.net/hekaiyou/article/details/53218863
import 'package:flutter/material.dart';

class RowLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("水平方向布局"),
      ),
      body: new Row(
        children: <Widget>[
          new RaisedButton(
            onPressed: (){print('点击红色按钮');},
            color: const Color(0xffcc0000),
            child: new Text("red "),
          ),
          new Expanded(
              flex: 1,
              child: new RaisedButton(
                onPressed:  (){print('点击黄色按钮');},
                color: const Color(0xfff1c232),
                child: new Text("yellow "),
              )
          ),
          new RaisedButton(
            onPressed:  (){print('点击蓝色按钮');},
            color: Colors.blue,
            child: new Text("blue "),
          ),
        ]
      ),
    );
  }
}


class ColumnLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("垂直方向布局"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text('红色按钮'),
          ),
          new Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: new RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
              },
              color: const Color(0xfff1c232),
              child: new Text('黄色按钮'),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print('点击粉色按钮事件');
            },
            color: const Color(0xffea9999),
            child: new Text('粉色按钮'),
          ),
        ],
      ),
    );
  }

}