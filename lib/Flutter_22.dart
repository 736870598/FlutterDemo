//https://blog.csdn.net/hekaiyou/article/details/54607119

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadAndWriteDemo extends StatefulWidget {

  @override
  _ReadAndWriteDemoState createState() => new _ReadAndWriteDemoState();

}

class _ReadAndWriteDemoState extends State<ReadAndWriteDemo>{

  int _counter;

  @override
  void initState(){
    super.initState();

    _readCounter().then((int value){
      setState((){
        _counter = value;
      });
    });
  }

//从本地读取文件内容，异步操作。。。
  Future<int> _readCounter() async{
    try{
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException{
      return 0;
    }
  }

//  打开文件...
  Future<File> _getLocalFile() async{
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/counter.txt");
  }

//  写入文件
  Future<Null> _incrementCounter() async{
    setState((){
      _counter = _counter + 1;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(title: new Text("读写文件操作")),
     body: new Center(
       child: new Text("点击按钮：$_counter 次！"),
     ),
     floatingActionButton: new FloatingActionButton(
         onPressed: _incrementCounter,
       child: new Icon(Icons.add)),
   );
  }

}
