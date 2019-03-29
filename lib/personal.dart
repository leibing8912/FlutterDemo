import 'package:flutter/material.dart';
import 'model.dart';
import 'details.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Personal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Personal();
  }
}

class _Personal extends State {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new ListView.builder(itemCount: 20, itemBuilder: buildItem));
  }

  Widget buildItem(BuildContext context, int i) {
    i = 19 - i;
    return new GestureDetector(
      onTap: () {
        // 处理点击事件
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new Details(itemModel[i].bgUrl);
        }));
      },
      child: new Container(
          padding: const EdgeInsets.all(8.0),
          // BoxFit 可设置展示图片时 的填充方式
          child: new CachedNetworkImage(
            imageUrl: itemModel[i].bgUrl,
            fit: BoxFit.fill,
            placeholder: new CircularProgressIndicator(),
          )),
    );
  }
}
