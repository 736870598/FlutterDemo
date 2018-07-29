//https://blog.csdn.net/hekaiyou/article/details/54895095

import 'package:flutter/material.dart';

const String _explanatoryText =  "当Scaffold的浮动操作按钮改变时，新按钮消失并变成视图。"
    "在这个Demo中，更改选项卡会导致应用程序与浮动操作按钮重建，Scaffold通过键值与其他区分。";


//定义page类
/*
页面类
成员变量：标签名称、颜色、图标
成员函数：
  获取卡片标签颜色
  获取浮动按钮定义是否为空
  获取浮动按钮的颜色
  获取浮动按钮的图标
  获取浮动按钮的键值
 */
class _Page{

  final String label;
  final MaterialColor colors;
  final IconData icon;

  _Page({
    this.label, this.colors, this.icon
  });

  Color get labelColor => colors != null ? colors[300] : Colors.grey[300];
  bool get fabDefined => colors != null && icon != null;
  Color get fabColor => colors[400];
  Icon get fabIcon => new Icon(icon);
  Key get fabKey => new ValueKey<Color>(fabColor);
}

//所有页面类的列表
final List<_Page> _allPages = <_Page>[
  new _Page(label: "蓝色", colors: Colors.indigo, icon: Icons.add),
  new _Page(label: "绿色", colors: Colors.green, icon: Icons.create),
  new _Page(label: "空白"),
  new _Page(label: "蓝绿色", colors: Colors.teal, icon: Icons.add),
  new _Page(label: "红色", colors: Colors.red, icon: Icons.create),
];


class MyHomePage extends StatefulWidget{

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  //应用程序的唯一键值，Scaffold的状态
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  //标记当前以选中的page
  _Page _selectPage;

  //init函数
  @override
  void initState(){
    super.initState();
    _controller = new TabController(length: _allPages.length, vsync: this);
    _controller.addListener(_handleTabSelection);
    _selectPage = _allPages[0];
  }


  //SingleTickerProviderStateMixin的dispose函数
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  //tab的选中回调事件
  void _handleTabSelection(){
    setState((){
      _selectPage = _allPages[_controller.index];
    });
  }

  //设置卡片控件文本信息
  void _showExplanatoryText(){
    _scaffoldKey.currentState.showBottomSheet((BuildContext context){
      return new Container(
        decoration: new BoxDecoration(
          //边框颜色
            border: new Border(top: new BorderSide(color: Theme.of(context).dividerColor))
        ),
        //内容
        child: new Padding(
            child: new Text(_explanatoryText),
            padding: const EdgeInsets.all(32.0)),
      );
    });
  }

  //设置内容控件
  Widget buildTabView(_Page page){
    return new Builder(builder: (BuildContext context){
      return new Container(
        key: new ValueKey(page.label),
        padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
        child: new Card(
          child: new Center(
            child: new Text(
              page.label,
              style: new TextStyle(
                color: page.labelColor,
                fontSize: 32.0,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("质感设计之卡片"),
        bottom: new TabBar(
          tabs: _allPages.map(
                  (_Page page){
                return new Tab(
                  text: page.label,
                );
              }
          ).toList(),
          controller: _controller,),
      ),
      floatingActionButton: !_selectPage.fabDefined ? null :
      new FloatingActionButton(
          key: _selectPage.fabKey,
          tooltip: _selectPage.hashCode.toString(),
//          tooltip: "显示说明",
          backgroundColor: _selectPage.fabColor,
          child: _selectPage.fabIcon,
          onPressed: _showExplanatoryText
      ),
      body: new TabBarView(
        children: _allPages.map(buildTabView).toList(),
        controller: _controller,),
    );
  }

}



