import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:area/prefab/ButtonWidget.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);
const background_action_reaction_card = const Color(0xFF444064);
const background_action_card = const Color(0xFFFF7473);
const background_reaction_card = const Color(0xFF42BB73);

class WidgetImg extends StatefulWidget {
  String path;
  double widthImg;
  double heightImg;

  WidgetImg(String _path, double _widthImg, double _heightImg) {
    this.path = _path;
    this.widthImg = _widthImg;
    this.heightImg = _heightImg;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetImg(path, widthImg, heightImg);
  }
}

class _WidgetImg extends State<WidgetImg> {
  String path;
  double widthImg;
  double heightImg;

  _WidgetImg(String _path, double _widthImg, double _heightImg) {
    this.path = _path;
    this.widthImg = _widthImg;
    this.heightImg = _heightImg;
  }

  @override
  Widget build(BuildContext context) {
    return new Image.asset(
      path,
      width: widthImg,
      height: heightImg,
    );
  }
}

class ScrollingWidget extends StatefulWidget {
  List<Widget> itemsData = [];

  @override
  ScrollingWidget(List<Widget> _itemsData) {
    this.itemsData = _itemsData;
  }

  State<StatefulWidget> createState() {
    return new _ScrollingWidget(itemsData);
  }
}

class _ScrollingWidget extends State<ScrollingWidget> {
  List<Widget> itemsData = [];
  ScrollController controller = ScrollController();

  _ScrollingWidget(List<Widget> _itemsData) {
    this.itemsData = _itemsData;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: itemsData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return itemsData[index];
        },
      ),
    );
  }
}

class HeaderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HeaderWidget();
  }
}

class _HeaderWidget extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        WidgetImg("img/logo.png", 70, 70),
        WidgetFlatButton("Deconnexion", "/", 20, 10, 12, 120),
      ]),
      Padding(
          padding: EdgeInsets.only(
        left: 20,
      )),
      WidgetText(
          'Bonjour ' + context.read<Data>().getUser() + " !", 19, Colors.white),
      Padding(
          padding: EdgeInsets.only(
        left: 0,
      )),
    ]);
  }
}
