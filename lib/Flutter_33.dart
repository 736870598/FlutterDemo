//https://blog.csdn.net/hekaiyou/article/details/70885914
import 'package:flutter/material.dart';

//GridView（网格视图）
class MyGridView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    List<Image> _buildGridTileList(int count){

      List<Image> imageList = new List();
      for(int i = 0; i < count; i++){
        imageList.add(new Image.asset('images/img_${(i % 4) + 1}.jpg'));
      }
      return imageList;
    }

    Widget buildGrid(){

      return  new GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            crossAxisCount: 3,
            children: _buildGridTileList(20),
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
  }

}