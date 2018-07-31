//https://blog.csdn.net/hekaiyou/article/details/61464235

import 'package:flutter/material.dart';

//29 这个 Input控件新版本没有了，但是不知道用什么替代。。。。。尴尬
class FormInputDemo extends StatefulWidget{
  @override
  _FormInoutDemo createState() => new _FormInoutDemo();
}

class _FormInoutDemo extends State<FormInputDemo>{

//  Inp

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("直接输入"),
      ),
      body: new Column(
        children: <Widget>[
//          new
        ],
      ),
    );

  }

}