
import 'package:flutter/material.dart';
import 'Flutter_1.dart';
import 'Flutter_2.dart';
import 'Flutter_3.dart';
import 'Flutter_4.dart';
import 'Flutter_5.dart';
import 'Flutter_6.dart';
import 'Flutter_7.dart';
import 'Flutter_8.dart';
import 'Flutter_9.dart';
import 'Flutter_10.dart';
import 'Flutter_11.dart';
import 'Flutter_12.dart';
import 'Flutter_13.dart';
import 'Flutter_14.dart';
import 'Flutter_15.dart';
import 'Flutter_16.dart';
import 'Flutter_17.dart';
import 'Flutter_18.dart';
import 'Flutter_19.dart';

class PageInfo{
  final String name;
  final Widget widget;
  const PageInfo({this.name, this.widget});
}

class ListItem extends StatelessWidget{

  final PageInfo pageInfo;

  ListItem({this.pageInfo}): super(key: new ObjectKey(pageInfo));

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => pageInfo.widget));
        },
        leading: new CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: new Text(pageInfo.name.split('_')[0]),
        ),
        title: new Text(pageInfo.name)
    );
  }

}

class _PageInfoListState extends State<PageInfoList> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的flutter练习"),
      ),
      body: new ListView(
        children: _kPageInfoList.map(
                (PageInfo pageInfo){
              return new ListItem(pageInfo: pageInfo);
            }
        ).toList(),
      ),
    );
  }

}

class PageInfoList extends StatefulWidget {

  @override
  _PageInfoListState createState() {
    return new _PageInfoListState();
  }

}

final List<PageInfo> _kPageInfoList = <PageInfo>[
  new PageInfo(name: "1_第一个Flutter实例", widget: new MyScaffold()),
  new PageInfo(name: "2_质感设计", widget: new TutorialHome()),
  new PageInfo(name: "3_手势处理", widget: new MyButton()),
  new PageInfo(name: "4_根据用户输入改变控件", widget: new Counter()),
  new PageInfo(name: "5_应用实例_购物清单", widget:  new ShoppingList()),
  new PageInfo(name: "6_常用控件之容器", widget:  new ContainerView()),
  new PageInfo(name: "7_常用控件之文本", widget:  new ContainerText()),
  new PageInfo(name: "8_常用控件之图片", widget:  new ImageDemo()),
  new PageInfo(name: "9_水平方向布局", widget:  new RowLayoutDemo()),
  new PageInfo(name: "9_垂直方向布局", widget:  new ColumnLayoutDemo()),
  new PageInfo(name: "10_层叠定位布局", widget:  new StackLayoutDemo()),
  new PageInfo(name: "11_滚动布局", widget:  new ScrollLayoutDemo()),
  new PageInfo(name: "12_中心对齐方式", widget:  new CenterLayoutDemo()),
  new PageInfo(name: "13_定位对齐方式", widget:  new AlignLayoutDemo()),
  new PageInfo(name: "14_填充对齐方式", widget:  new PaddingLayoutDemo()),
  new PageInfo(name: "15_强制大小对齐方式", widget:  new SizeLayoutDemo()),
  new PageInfo(name: "15_强制比例对齐方式", widget:  new ScaleLayoutDemo()),
  new PageInfo(name: "16_绘画效果之装饰容器", widget:  new DecorationDrawDemo()),
  new PageInfo(name: "17_绘画效果之不透明度", widget:  new OpacityDrawDemo()),
  new PageInfo(name: "18_显示菜单的点击事件", widget:  new MenusDemo()),
  new PageInfo(name: "19_质感设计之底部导航", widget:  new NavigationMenusDemo()),

];


void main(){
  runApp(new MaterialApp(
    home: new PageInfoList(),
  ));
}
