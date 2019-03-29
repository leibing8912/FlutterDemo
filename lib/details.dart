import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatefulWidget {
  // url
  final String itemUrl;

  Details(this.itemUrl);

  @override
  State<StatefulWidget> createState() {
    return new _Details(itemUrl);
  }
}

class _Details extends State<Details> {
  // url
  final String itemUrl;

  _Details(this.itemUrl);

  Widget buildView() {
    return new GestureDetector(
      onTap: () {
        // 处理点击事件
        Navigator.of(context).pop();
      },
      child: new Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          // BoxFit 可设置展示图片时 的填充方式
          child: new CachedNetworkImage(
              imageUrl: itemUrl,
              fit: BoxFit.fill,
              placeholder: new CircularProgressIndicator())),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SingleChildScrollView(
        child: new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Column(
        children: <Widget>[
          buildView(),
        ],
      ),
    ));
  }
}
