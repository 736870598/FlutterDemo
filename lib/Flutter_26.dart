//https://blog.csdn.net/hekaiyou/article/details/60581211

import 'package:flutter/material.dart';

class MyDialogDemo extends StatefulWidget{

  @override
  _DialogDemo createState() => new _DialogDemo();

}

class _DialogDemo extends State<MyDialogDemo>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showButtonSheetCallBack;

  @override
  void initState(){
    super.initState();
    _showButtonSheetCallBack = _showBottomSheet;
  }

  //显示底部标签，当显示的时候这种按钮不可点击
  void _showBottomSheet(){
    setState((){
      _showButtonSheetCallBack = null;
    });

    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState.showBottomSheet((BuildContext context){
      final ThemeData themeData = Theme.of(context);
      return new Container(
        decoration: new BoxDecoration(
            border: new Border(top: new BorderSide(color: themeData.dividerColor))
        ),
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Text(
            "这是一个持久性的底部面板，向下拖动即可将其关闭!",
            style: new TextStyle(
                color: themeData.accentColor,
                fontSize: 24.0
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    })

    /*
      closed：当此对象控制的元素不再可见时完成
      whenComplete：注册将在此未来完成时调用的函数
      解释：联系上文，closed控制的元素是新构建的质感设计底部面板，因此代码大意为，
           注册底部面板不再可见时调用的函数
     */
        .closed.whenComplete((){
      if(mounted){
        setState((){
          // 重新启用按钮
          _showButtonSheetCallBack = _showBottomSheet;
        });
      }
    });
  }

  void _showMessage(){
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("title"),
          content: new Text("这里是 content"),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){ Navigator.pop(context); },
                child: new Text("确定")),
            new FlatButton(
                onPressed: (){ Navigator.pop(context); },
                child: new Text("取消")),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(title: new Text("底部面板"),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showMessage,
        backgroundColor: Colors.red[200],
        child: new Icon(Icons.add),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: _showButtonSheetCallBack,
          child: new Text("显示底部面板"),),
      ),
    );
  }

}