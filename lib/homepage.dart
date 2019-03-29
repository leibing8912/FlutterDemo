import 'package:flutter/material.dart';
import 'details.dart';
import 'model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new GridViewState();
  }
}

class GridViewState extends State {
  @override
  Widget build(BuildContext context) =>
      new GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          // 竖向间距
          crossAxisCount: 2,
          // 横向Item的个数
          crossAxisSpacing: 8.0,
          // 横向间距
          children: buildGridList(20));

  List<Widget> buildGridList(int length) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < length; i++) {
      widgetList.add(getItemWidget(i));
    }
    return widgetList;
  }

  Widget getItemWidget(int i) {
    return new GestureDetector(
      onTap: () {
        // 处理点击事件
      Navigator.push( context,
          new MaterialPageRoute(builder: (context) {
            return new Details(itemModel[i].bgUrl);
          }));
      },
      child: new Container(
        padding: const EdgeInsets.all(8.0),
          child: new CachedNetworkImage(placeholder: new CircularProgressIndicator(),imageUrl: itemModel[i].bgUrl, fit: BoxFit.fill),
      ),
    );
  }
}
