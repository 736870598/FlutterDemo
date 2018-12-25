//https://blog.csdn.net/hekaiyou/article/details/54695133
import 'package:flutter/material.dart';


class ActionViewEcology extends StatelessWidget{

  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  ActionViewEcology({
    this.maximumEmergy : 100,
    this.maximumHunger : 100,
    this.maximumMood : 100,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  Align _getNameText(BuildContext context, String text){
    return new Align(
      alignment: FractionalOffset.topLeft,
      child: new Text(text,
        style: new TextStyle(
          fontSize: 15.0,
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("进度条"),),
      body: new Container(
        margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
        child: new Column(
          children: <Widget>[
            _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
            new LinearProgressIndicator(value: currentEmergy / maximumEmergy),
            _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
            new LinearProgressIndicator(value: currentHunger/maximumHunger),
            _getNameText(context, '心情（$currentMood/$maximumMood）'),
            new LinearProgressIndicator(value: currentMood/maximumMood),
          ],
        ),
      ),
    );
//    return new Container(
//      margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
//      child: new Column(
//        children: <Widget>[
//          _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
//          new LinearProgressIndicator(value: currentEmergy / maximumEmergy),
//          _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
//          new LinearProgressIndicator(value: currentHunger/maximumHunger),
//          _getNameText(context, '心情（$currentMood/$maximumMood）'),
//          new LinearProgressIndicator(value: currentMood/maximumMood),
//        ],
//      ),
//    );
  }
}