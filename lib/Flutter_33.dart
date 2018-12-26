//https://blog.csdn.net/hekaiyou/article/details/70885914
import 'package:flutter/material.dart';

//GridView（网格视图）
class MyGridView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<Container> _buildGridTileList(int count){
//      return new List<Container>.generate(length, generator)
      return new List<Container>.generate(
          count, (int index){new Container(child: new Image.asset("images/img_${(index % 4) + 1}.jpg"));}
      );
    }

    Widget buildGrid(){
      return new GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(20),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("------"),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

}