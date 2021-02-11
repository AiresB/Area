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
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

class WidgetTextField extends StatefulWidget {
  String sentence;

  WidgetTextField(String _sentence) {
    this.sentence = _sentence;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetTextField(sentence);
  }
}

class _WidgetTextField extends State<WidgetTextField> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();
  String sentence;

  _WidgetTextField(String _sentence) {
    this.sentence = _sentence;
  }

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 200,
        margin: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
        child: TextField(
          controller: _controller,
          focusNode: myFocusNode,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            labelText: sentence,
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: button),   
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: background),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: button),
            ),
            labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? button : Colors.white
            ),
          ),
          onSubmitted: (value) async {
              print("Submitted");
          },
        ),
    );
  }
}

class WidgetTextFieldPassword extends StatefulWidget {
  String sentence;

  WidgetTextFieldPassword(String _sentence) {
    this.sentence = _sentence;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetTextFieldPassword(sentence);
  }
}

class _WidgetTextFieldPassword extends State<WidgetTextFieldPassword> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();
  String sentence;

  _WidgetTextFieldPassword(String _sentence) {
    this.sentence = _sentence;
  }

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 200,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        child: TextField(
          controller: _controller,
          focusNode: myFocusNode,
          obscureText: true,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            labelText: sentence,
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: button),   
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: background),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: button),
            ),
            labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? button : Colors.white
            ),
          ),
          onSubmitted: (value) async {
              print("Submitted");
          },
        ),
      );
    }
}

class WidgetRaisedButton extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetRaisedButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRaisedButton(sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetRaisedButton extends State<WidgetRaisedButton> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetRaisedButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: ButtonTheme(
        minWidth: minWidthButton,
        height: heightButton,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(path);
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            sentence,
            style: new TextStyle(
              fontSize: fontSizeText,
                color: Colors.white,
            ),
          ),
          color: button,
        ),
      ),
    );
  }
}

class WidgetFlatButton extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetFlatButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetFlatButton(sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetFlatButton extends State<WidgetFlatButton> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetFlatButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      width: 200,
      height: 40,
      color: Colors.transparent,
      child: ButtonTheme(
        minWidth: minWidthButton,
        height: heightButton,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(path);
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            sentence,
            style: new TextStyle(
              fontSize: fontSizeText,
              color: button,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}


