//http://flutter.link/2018/05/03/ListView%E4%B8%8B%E6%8B%89%E5%88%B7%E6%96%B0%E4%B8%8E%E5%8A%A0%E8%BD%BD%E6%9B%B4%E5%A4%9A/

import 'package:flutter/material.dart';

class RefreshPullView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RefreshPullViewState();
  }
}

class RefreshPullViewState extends State<RefreshPullView>{

  List<Image> mainList = _buildGridTileList(5);
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    mainList = _buildGridTileList(15);
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print("loadMore");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RefreshPullView"),),
      body: buildChild(),
    );
  }


  Widget buildChild(){
    return new RefreshIndicator(
        child: new GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(4.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: mainList.length,
          itemBuilder: (content, index){return mainList[index];},
          controller: _scrollController,
        ),
        onRefresh: _handleRefresh);
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        print("refresh");
        mainList.clear();
        mainList = _buildGridTileList(15);
        return null;
      });
    });
  }
}

//生成数据
List<Image> _buildGridTileList(int count){
  List<Image> imageList = new List();
  for(int i = 0; i < count; i++){
    imageList.add(new Image.asset('images/img_${(i % 4) + 1}.jpg'));
  }
  return imageList;
}