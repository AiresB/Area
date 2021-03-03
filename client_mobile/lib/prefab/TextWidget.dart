import 'package:flutter/material.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);
const background_action_reaction_card = const Color(0xFF444064);
const background_action_card = const Color(0xFFFF7473);
const background_reaction_card = const Color(0xFF42BB73);

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
  Function function;

  WidgetTextField({Key key, this.sentence, this.function}) : super(key: key);

  @override
  _WidgetTextField createState() => _WidgetTextField();
}

class _WidgetTextField extends State<WidgetTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.sentence,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: button),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: background),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: button),
          ),
          labelStyle:
              TextStyle(color: myFocusNode.hasFocus ? button : Colors.white),
        ),
        onSubmitted: (value) async {
          widget.function(_controller.text.toString());
        },
      ),
    );
  }
}

class WidgetTextFieldPassword extends StatefulWidget {
  String sentence;
  Function function;

  WidgetTextFieldPassword({Key key, this.sentence, this.function})
      : super(key: key);

  @override
  _WidgetTextFieldPassword createState() => _WidgetTextFieldPassword();
}

class _WidgetTextFieldPassword extends State<WidgetTextFieldPassword> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();

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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.sentence,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: button),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: background),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: button),
          ),
          labelStyle:
              TextStyle(color: myFocusNode.hasFocus ? button : Colors.white),
        ),
        onSubmitted: (value) async {
          widget.function(_controller.text.toString());
        },
      ),
    );
  }
}
