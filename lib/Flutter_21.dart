//https://blog.csdn.net/hekaiyou/article/details/54602103

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String url = "https://domokit.github.io/examples/stocks/data/stock_data_2.json";

class HttpRequestDemo extends StatefulWidget {

  @override
  _HttpRequestDemo createState() => new _HttpRequestDemo();

}

class _HttpRequestDemo extends State<HttpRequestDemo> {

  Map<String, String> headerMap;
  String result = "";

  Future<Null> _networkLoading(String url) async{
    http.get(url).then((http.Response response) {
      //赋值
        String netData = response.body;
        JsonDecoder decoder = new JsonDecoder();
        List<List<String>> json = decoder.convert(netData);

        print(json);

        setState((){
          headerMap = response.headers;
          result = json.toString();
        });

    });
  }


  TextStyle getStyle(){
    return new TextStyle(fontSize: 20.0, color: Colors.lightBlueAccent, letterSpacing: 2.0);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("异步加载网络资源"),),
      body: new ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          new Text("请求地址：", style: getStyle()),
          new Text(url),
          new Text("响应头：", style: getStyle()),
          new Center(child: new Text(headerMap.toString())),
          new Text("响应体：", style: getStyle()),
          new Center(child: new Text(result))
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){ _networkLoading(url); },
      ),
    );
  }
}
