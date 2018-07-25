//https://blog.csdn.net/hekaiyou/article/details/53064762
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Counter(),
  ));
}

class Counter extends StatefulWidget{

  @override
  _CounterState createState() => new _CounterState();

}

class _CounterState extends State<Counter>{

  int _count = 0;

  void _increment(){
    setState(
            (){
          _count++;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("根据用户输入改变控件"),
      ),
      body: new CounterDisplay(count: _count,),
      floatingActionButton: new CounterInterceptor(onPressed: _increment),
    );
  }
}


class CounterDisplay extends StatelessWidget {

  final int count;
  CounterDisplay({this.count});


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("按钮点击了 $count 次"),
    );
  }

}

class CounterInterceptor extends StatelessWidget {

  final VoidCallback onPressed;
  CounterInterceptor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: onPressed,
      tooltip: "Add",
      child: new Icon(Icons.add),);
  }}
