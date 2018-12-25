//https://blog.csdn.net/hekaiyou/article/details/60782951

import 'package:flutter/material.dart';

class ShowModalBottomDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("底部面板"),
      ),
      body: new Center(
          child: new RaisedButton(
            child: new Text("显示底部面板"),
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context){
                    return new Container(
                      child: new Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Text(
                          '这是模态底部面板，点击任意位置即可关闭',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24.0
                          ),
                        ),
                      ),
                    );
                  }
              );
            },
          )
      ),
    );
  }

}