import 'package:flutter/material.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);

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

class WidgetText extends StatefulWidget {
  String sentence;
  double fontSize;
  var color;

  WidgetText(String _sentence, double _fontSize, var _color) {
    this.sentence = _sentence;
    this.fontSize = _fontSize;
    this.color = _color;
  }

  @override
    State<StatefulWidget> createState() {
      return new _WidgetText(sentence, fontSize, color);
  }
}

class _WidgetText extends State<WidgetText> {
  String sentence;
  double fontSize;
  var color;

  _WidgetText(String _sentence, double _fontSize, var _color) {
    this.sentence = _sentence;
    this.fontSize = _fontSize;
    this.color = _color;
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
      sentence,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}