//https://blog.csdn.net/hekaiyou/article/details/54709633
import 'package:flutter/material.dart';

//枚举，用于控制tab的显示状态
enum TabsDemoStyle{
  iconsAndText,
  iconsOnly,
  textOnly,
}

//定义一个 page 的类， 类或成员属性前面加_表示私有的，相当于private
class _Page{
  final IconData icon;
  final String text;
  _Page({this.icon, this.text});
}

//定义一个 _page 的list， 定义list方法：List<Object> list = <Object>[Object1,....,ObjectN];
final List<_Page> _allPages = <_Page>[
  new _Page(icon: Icons.event, text: "EVENT"),
  new _Page(icon: Icons.home, text: "HOME"),
  new _Page(icon: Icons.android, text: "ANDROID"),
  new _Page(icon: Icons.alarm, text: "ALARM"),
  new _Page(icon: Icons.face, text: "FACE"),
  new _Page(icon: Icons.language, text: "LANGUAGE"),
];

//定义一个显示的布局 StatefulWidget是可改变内部属性的Widget。
class ScrollableTabsDemo extends StatefulWidget{

  //要返回一个继承State的Widget
  @override
  _ScrollableTabsDemoState createState() => new _ScrollableTabsDemoState();
}

//
class _ScrollableTabsDemoState extends State<ScrollableTabsDemo> with SingleTickerProviderStateMixin {

  //定义一个tab控制器
  TabController _controller;
  //默认显示tab的状态
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText;

  //init函数。
  @override
  void initState(){
    super.initState();
    _controller = new TabController(length: _allPages.length, vsync: this);
  }

  //SingleTickerProviderStateMixin的dispose函数
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  //定义一个函数，用于状态改变时调用
  void changeDemoStyle(TabsDemoStyle style){
    //设置状态改变...这里相当与MVVM框架。
    //值改变，引用该值的地方动态被调用到
    setState((){
      _demoStyle = style;
    });
  }

  //显示在界面上的控件。。。
  @override
  Widget build(BuildContext context){
    //获取app默认主题的颜色值， 获取app默认主题：Theme.of(context)
    final Color iconColor = Theme.of(context).accentColor;
    return new Scaffold(
      //appbar
      appBar: new AppBar(
        //title
        title: new Text("可滚动标签页"),
        actions: <Widget>[
          //菜单栏
          new PopupMenuButton<TabsDemoStyle>(
            //设置选中响应函数
            onSelected: changeDemoStyle,
            //设置item的显示  list
            itemBuilder: (BuildContext context) => <PopupMenuItem<TabsDemoStyle>>[
              new PopupMenuItem(
                child: new Text("图标和文本"),
                value: TabsDemoStyle.iconsAndText,
              ),
              new PopupMenuItem(
                  value: TabsDemoStyle.iconsOnly,
                  child: new Text('仅图标')
              ),
              new PopupMenuItem<TabsDemoStyle>(
                  value: TabsDemoStyle.textOnly,
                  child: new Text('仅文本')
              )
            ],
          )
        ],
        //appbar下面显示的tabBar
        bottom: new TabBar(
          tabs: _allPages.map(
                  (_Page page){
                switch(_demoStyle){
                  case TabsDemoStyle.iconsAndText:
                    return new Tab(text: page.text, icon: new Icon(page.icon));
                  case TabsDemoStyle.iconsOnly:
                    return new Tab(icon: new Icon(page.icon),);
                  case TabsDemoStyle.textOnly:
                    return new Tab(text: page.text,);
                }
              }
          ).toList(),
          controller: _controller,
          isScrollable: true,),
      ),
      //body
      body: new TabBarView(
        children: _allPages.map(
                (_Page page){
              return new Container(
                key: new ObjectKey(page.icon),
                padding: const EdgeInsets.all(12.0),
                child: new Card(
                  child: new Center(
                    child: new Icon(
                      page.icon,
                      color: iconColor,
                      size: 128.0,
                    ),
                  ),
                ),
              );
            }
        ).toList(),
        controller: _controller,),

    );
  }

}