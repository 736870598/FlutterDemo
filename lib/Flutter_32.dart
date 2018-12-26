//https://blog.csdn.net/hekaiyou/article/details/70849178
import 'package:flutter/material.dart';

class RowAndColumnLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget packedRow = new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(Icons.star, color: Colors.green[500],),
        new Icon(Icons.star, color: Colors.green[500],),
        new Icon(Icons.star, color: Colors.green[500],),
        new Icon(Icons.star, color: Colors.black,),
        new Icon(Icons.star, color: Colors.black,),
      ],
    );

    TextStyle descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: "Roboto",
      letterSpacing: 0.5,
      fontSize: 13.0,
      height: 2.0
    );

    Widget ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          packedRow,
          new Text(
            "233个评论",
            style: descTextStyle,
          )
        ],
      ),
    );
    
    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500],),
                  new Text("食材:"),
                  new Text("30分钟"),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500],),
                  new Text("烹饪:"),
                  new Text("5分钟"),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500],),
                  new Text("品尝:"),
                  new Text("25分钟"),
                ],
              ),
            ],
          ),
        )
    );

    Container titleText = new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Text(
        "黑椒牛排",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 20.0
        ),
      ),
    );

    Text subTitle = Text(
      "去超市买两块上好的牛排也不是很贵，至少比在外面吃要便宜很多。用黑胡椒碎、百里香、鼠尾草、迷迭香等混合成的香草料腌制提香味，大蒜、洋葱末去腥提鲜，柠檬汁去腥提味；在家也能打造出和西餐厅一样美味的黑椒香草牛排。咱也喝点红酒，看着电视，吃着牛排，感觉也不错呀！",
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: "Georgia", fontSize: 15.0),
    );

    Container leftColumn = new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          iconList
        ],
      ),
    );

    var mainImage = new Image.asset("images/img_1.jpg", fit: BoxFit.cover);


    return new Scaffold(
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.fromLTRB(0,5,0,5),
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Container(
                  width: 330,
                  child: leftColumn,
                ),
                mainImage
              ],
            ),
          ),
        ),
      ),
    );
  }

}

