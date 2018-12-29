//https://blog.csdn.net/hekaiyou/article/details/78153086


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformTalk extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _PlatformTalkState();
  }
}

class _PlatformTalkState extends State<PlatformTalk>{

  static const String CHANNEL = "com.example.flutterapp/plugin";
  static const platform = const MethodChannel(CHANNEL);
  String _returnData = "";

  Future<Null> _dataInteraction() async {
    String returnData;
    try {
      final int result = await platform.invokeMethod("dataInteraction", [1,2,3,4]);
      returnData = "平台返回数据：$result";
    }on PlatformException catch (e){
      returnData = "错误信息：${e.message}";
    }

    setState(() {
      _returnData = returnData;
    });
  }

  Future<Null> _getModel() async {
    try {
      Object object = await platform.invokeMethod("getModel", [1,2,3,4]);
      print(object);
    }on PlatformException catch (e){
      print(e.message);
    }
  }

  Future<Null> _startNewView() async {
    try {
      platform.invokeMethod("startNewView");
    }on PlatformException catch (e){
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("与平台交互"),),
      body: new Center(
          child: new Column(
            children: <Widget>[
              new RaisedButton(
                onPressed: _dataInteraction,
                child: new Text(_returnData),
              ),
              new RaisedButton(
                onPressed: _getModel,
                child: new Text("获取list model"),
              ),
              new RaisedButton(
                onPressed: _startNewView,
                child: new Text("跳转原生界面"),
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dataInteraction,
        child: new Icon(Icons.refresh),),
    );
  }

}