//https://blog.csdn.net/hekaiyou/article/details/54138448
import 'package:flutter/material.dart';

// 创建类，导航图标视图
class NavigationIconView{
  final Widget _icon;
  final Color _color;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  /// 构造函数
  /// * Ticker提供者
  /// *  由类实现的接口，可以提供Ticker对象
  /// *  Ticker对象：每个动画帧调用它的回调一次
  NavigationIconView({Widget icon, Widget title, Color color, TickerProvider vsync})
      : _icon = icon,
        _color = color,
  // 创建底部导航栏项目
        item = new BottomNavigationBarItem(icon: icon, title: title),
  // 创建动画控制器   // vsync 垂直同步
        controller =  new AnimationController(duration: kThemeAnimationDuration, vsync: vsync){
    // 创建曲线动画
    _animation = new CurvedAnimation(
      // 应用曲线动画的动画
      parent: controller,
      curve: new Interval(0.0,1.0,curve: Curves.fastOutSlowIn),
    );
  }

  /*
   * 类函数，过渡转换
   *  BottomNavigationBarType：定义底部导航栏的布局和行为
   *  BuildContext：处理控件树中的控件
   */
  FadeTransition transition(BottomNavigationBarType type, BuildContext context){
    Color iconColor;
    if(type == BottomNavigationBarType.shifting){
      iconColor = _color;
    }else{
      /*
       * 保存质感设计主题的颜色和排版值：
       *  使用ThemeData来配置主题控件
       *  使用Theme.of获取当前主题
       */
      final ThemeData themeData = Theme.of(context);
      /*
       * 如果程序整体主题的亮度很高（需要深色文本颜色才能实现可读的对比度）
       *  就返回程序主要部分的背景颜色作为图标颜色
       *  否则返回控件的前景颜色作为图标颜色
       */
      iconColor = themeData.brightness == Brightness.light ?
      themeData.primaryColor : themeData.accentColor;
    }
    // 返回值，创建不透明度转换
    return new FadeTransition(
      // 控制子控件不透明度的动画
      opacity: _animation,
      // 子控件：创建滑动转换过渡
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.2),
          end: const Offset(0.0,0.0),
        ).animate(_animation),
        // 子控件：创建控制子控件的颜色，不透明度和大小的图标主题
        child: new IconTheme(
            data: new IconThemeData(
              // 用于子控件中图标的颜色，不透明度和大小
                color: iconColor,
                size: 120.0
            ),
            // 子控件
            child: _icon),
      ),
    );
  }
}

// 创建类，自定义图标，继承StatelessWidget（无状态的控件）
class CustomIcon extends StatelessWidget{
  // 覆盖此函数以构建依赖于动画的当前状态的控件
  @override
  Widget build(BuildContext context) {
    // 获取当前图标主题，创建与此图标主题相同的图标主题
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size - 8.0,
      height: iconTheme.size - 8.0,
      decoration: new BoxDecoration(
          color: iconTheme.color
      ),
    );
  }
}

// 创建类，菜单演示，继承StatefulWidget（有状态的控件）
class NavigationMenusDemo extends StatefulWidget{

  /*
   * 覆盖具有相同名称的超类成员
   * createState方法在树中的给定位置为此控件创建可变状态
   *  子类应重写此方法以返回其关联的State子类新创建的实例
   */
  @override
  _MenusDemoState createState() => new _MenusDemoState();
}

/*
 * 关联State子类的实例
 * 继承State：StatefulWidget（有状态的控件）逻辑和内部状态
 * 继承TickerProviderStateMixin，提供Ticker对象
 */
class _MenusDemoState extends State<NavigationMenusDemo> with TickerProviderStateMixin{
  int _currentIndex = 2;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  /*
   * 在对象插入到树中时调用
   *  框架将为它创建的每个State（状态）对象调用此方法一次
   * 覆盖此方法可以实现此对象被插入到树中的位置的‘初始化’
   * 或用于配置此对象上的控件的位置的初始化
   */
  @override
  void initState() {
    super.initState();

    /*
       * 创建NavigationIconView类的实例
       *  传递图标参数
       *  传递标题参数
       *  传递颜色参数
       *  传递Ticker对象
       */
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text("成就"),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new CustomIcon(),
        title: new Text("行动"),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.favorite),
        title: new Text("财产"),
        color: Colors.indigo[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text("设置"),
        color: Colors.pink[500],
        vsync: this,
      )
    ];
//    for (NavigationIconView view in _navigationViews){
//      // 每次动画控制器的值更改时调用侦听器
//      view.controller.addListener(_rebuild);
//    }
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose(){
    super.dispose();
    for (NavigationIconView value in _navigationViews) {
      value.controller.dispose();
    }
  }



  Widget _buildTransitionsStack(){
    final List<FadeTransition> transitions = <FadeTransition>[];
    for(NavigationIconView view in _navigationViews){
      transitions.add(view.transition(_type, context));
    }
    transitions.sort(
            ( FadeTransition a, FadeTransition b) {
          final Animation<double> aAnimation = a.opacity;
          final Animation<double> bAnimation = b.opacity;
          double aValue = aAnimation.value;
          double bValue = bAnimation.value;

          return aValue.compareTo(bValue);
        }
    );
    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context){
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index){
        setState((){
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("底部导航演示"),
        actions: <Widget>[
          new PopupMenuButton<BottomNavigationBarType>(
              onSelected: (BottomNavigationBarType value) {
                setState((){
                  _type = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<BottomNavigationBarType>> [
                new PopupMenuItem<BottomNavigationBarType>(
                    value: BottomNavigationBarType.fixed,
                    child: new Text('Fixed')
                ),
                new PopupMenuItem<BottomNavigationBarType>(
                    value: BottomNavigationBarType.shifting,
                    child: new Text('Shifting')
                )
              ]
          )
        ],
      ),
      body: new Center(
        child: _buildTransitionsStack(),
      ),
      bottomNavigationBar: botNavBar,
    );
  }


}
