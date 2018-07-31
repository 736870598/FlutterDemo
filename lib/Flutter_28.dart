//https://blog.csdn.net/hekaiyou/article/details/61197710

import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget{

  @override
  _FormDemo createState() => new _FormDemo();
}

class _FormDemo extends State<FormDemo>{

  String _lastName;
  String _firstName;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _showMessage(String name){
    showDialog(
        context: context,
        child: new AlertDialog(
          content: new Text(name),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){ Navigator.pop(context); },
                child: new Text("确定"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("表单输入"),
      ),
      body: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                initialValue: '名字',
                onSaved: (String str){
                  _lastName = str;
                },
              ),
              new TextField (
//                initialValue: "名字",
              controller: new TextEditingController(text: "姓名"),
                onChanged: (String str){
                  _firstName = str;
                },
              ),
              new Row(
                children: <Widget>[
                  new RaisedButton(
                      child :new Text("重置"),
                      onPressed: (){
                        _formKey.currentState.reset();
                        _showMessage("姓名信息已经重置！");
                      }
                  ),
                  new RaisedButton(
                      child: new Text("提交"),
                      onPressed: (){
                        _formKey.currentState.save();
                        _showMessage("你的姓名是：" + _lastName + _firstName);
                      })
                ],
              )
            ],
          )),
    );
  }

}