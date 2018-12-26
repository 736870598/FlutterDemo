//https://blog.csdn.net/hekaiyou/article/details/70885914
import 'package:flutter/material.dart';

//GridView（网格视图）
class MyGridView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    List<Image> _buildGridTileList(int count){
      return new List<Image>.generate(
          count,
              (index){new Image.asset("images/img_1.jpg");}
      );
    }

    Widget buildGrid(){
      return new GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        crossAxisCount: 2,
        children: _buildGridTileList(20),
//        children: <Widget>[
//          new Image.asset('images/img_1.jpg'),
//          new Image.asset('images/img_2.jpg'),
//          new Image.asset('images/img_3.jpg'),
//          new Image.asset('images/img_4.jpg'),
//          new Image.asset('images/img_1.jpg'),
//          new Image.asset('images/img_2.jpg'),
//          new Image.asset('images/img_3.jpg'),
//          new Image.asset('images/img_4.jpg'),
//          new Image.asset('images/img_1.jpg'),
//          new Image.asset('images/img_2.jpg'),
//          new Image.asset('images/img_3.jpg'),
//          new Image.asset('images/img_4.jpg'),
//        ],
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView（网格视图）"),
      ),
      body: new Center(
        child: buildGrid() ,
      ),
    );

//    return buildGrid();
  }

}