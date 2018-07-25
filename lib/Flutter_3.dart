//https://blog.csdn.net/hekaiyou/article/details/53019717
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyButton(),
  ));
}

class MyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        print("myBtn onTap");
      },
      onTapDown: (e){
        print("myBtn onTapDown == " + e.globalPosition.toString());
      },
      onTapUp: (e){
        print("myBtn onTapDown == " + e.globalPosition.toString());
      },
      onDoubleTap: (){
        print("myBtn onDoubleTap");
      },
      child: new Container(
        height: 40.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen
        ),
        child: new Center(
          child: new Text("点击监听..."),
        ),
      ),
    );
  }
  
}
