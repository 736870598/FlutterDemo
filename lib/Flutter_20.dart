//https://blog.csdn.net/hekaiyou/article/details/54311757

import 'package:flutter/material.dart';

class Target{
  final String name;
  final String reward;
  const Target({this.name, this.reward});
}

typedef void TargetChangedCallback(Target target, bool newTarget);

class AchievementViewItem extends StatelessWidget {

  final Target target;
  final bool nowTarget;
  final TargetChangedCallback onTargetChanged;

  AchievementViewItem({this.target, this.nowTarget, this.onTargetChanged}):
        super(key: new ObjectKey(target));

  Color _getColor(BuildContext context){
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getNameTextStyle(BuildContext context){
    if (!nowTarget){
      return new TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
    return new TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle _getRewardTextStyle(BuildContext context){
    if(!nowTarget){
      return new TextStyle(
        fontSize: 13.0,
        color: Colors.black,
      );
    }
    return new TextStyle(
        fontSize: 13.0,
        color: Colors.black54,
        decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context){
    return new ListTile(
      onTap: (){
        onTargetChanged(target, !nowTarget);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(target.name[0]),
      ),
      title: new Text(target.name, style: _getNameTextStyle(context)),
      subtitle: new Text('奖励\n'+target.reward, style: _getRewardTextStyle(context)),
      trailing: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text('奖'),
      ),
    );
  }
}


class AchievementViewList extends StatefulWidget{

  final List<Target> targets;

  AchievementViewList({this.targets, Key key}): super(key: key);

  @override
  _AchievementViewState createState() => new _AchievementViewState();

}

class _AchievementViewState extends State<AchievementViewList> {

  Set<Target> _achievements = new Set<Target>();

  void _achievementsChanged(Target target, bool nowTarget) {
    setState((){
      if(nowTarget){
        _achievements.add(target);
      }else{
        _achievements.remove(target);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: widget.targets.map(
                (Target target){
              return new AchievementViewItem(
                target: target,
                nowTarget: _achievements.contains(target),
                onTargetChanged: _achievementsChanged,
              );
            }
        ).toList()
    );
  }

}

class AchievementView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("质感设计之列表项"),),
      body: new AchievementViewList(targets: _kTargets,),
    );
  }

}

final List<Target> _kTargets = <Target>[
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
];
