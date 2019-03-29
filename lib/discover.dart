import 'package:flutter/material.dart';
import 'model.dart';
import 'details.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Discover();
  }
}

class _Discover extends State<Discover> {
  Widget buildView(Model model) {
    return new GestureDetector(
      onTap: () {
        // 处理点击事件
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new Details(model.bgUrl);
        }));
      },
      child: new Container(
          padding: const EdgeInsets.all(8.0),
          // BoxFit 可设置展示图片时 的填充方式
          child: new CachedNetworkImage(
            imageUrl: model.bgUrl,
            fit: BoxFit.fill,
            placeholder: new CircularProgressIndicator(),
          )),
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
          buildView(itemModel[9]),
          buildView(itemModel[7]),
          buildView(itemModel[5]),
          buildView(itemModel[3]),
          buildView(itemModel[1]),
          buildView(itemModel[0]),
          buildView(itemModel[2]),
          buildView(itemModel[4]),
          buildView(itemModel[6]),
          buildView(itemModel[8]),
          buildView(itemModel[10]),
          buildView(itemModel[12]),
          buildView(itemModel[14]),
          buildView(itemModel[16]),
          buildView(itemModel[18])
        ],
      ),
    ));
  }
}
