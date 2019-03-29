import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import 'homepage.dart';
import 'lightspot.dart';
import 'attention.dart';
import 'discover.dart';
import 'personal.dart';

class Index extends StatefulWidget {

  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin{

  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.videocam),
        title: new Text("直播"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.lightbulb_outline),
        title: new Text("亮点"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.filter_center_focus),
        title: new Text("关注"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.find_in_page),
        title: new Text("发现"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.perm_identity),
        title: new Text("个人中心"),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new Homepage(),
      new Lightspot(),
      new Attention(),
      new Discover(),
      new Personal()
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState((){});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState((){
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        }
    );

    return new MaterialApp(
        home: new Scaffold(
          body: new Center(
              child: _currentPage
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
        theme: new ThemeData.dark()
    );
  }
}