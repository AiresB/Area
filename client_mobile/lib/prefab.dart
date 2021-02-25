import 'package:area/authService.dart';
import 'package:flutter/material.dart';

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
  String buffer;

  WidgetTextField(String _sentence, String _buffer) {
    this.sentence = _sentence;
    this.buffer = _buffer;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetTextField(sentence, buffer);
  }
}

class _WidgetTextField extends State<WidgetTextField> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();
  String sentence;
  String buffer;

  _WidgetTextField(String _sentence, String _buffer) {
    this.sentence = _sentence;
    this.buffer = _buffer;
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
              buffer = value;
          },
        ),
    );
  }
}

class WidgetTextFieldPassword extends StatefulWidget {
  String sentence;
  String buffer;

  WidgetTextFieldPassword(String _sentence, String _buffer) {
    this.sentence = _sentence;
    this.buffer = _buffer;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetTextFieldPassword(sentence, buffer);
  }
}

class _WidgetTextFieldPassword extends State<WidgetTextFieldPassword> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();
  String sentence;
  String buffer;

  _WidgetTextFieldPassword(String _sentence, String _buffer) {
    this.sentence = _sentence;
    this.buffer = _buffer;
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
              buffer = value;
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
        top: 5.0,
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
        top: 5.0,
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

class ActionReactionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionReactionCard();
  }
}

class _ActionReactionCard extends State<ActionReactionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_action_reaction_card,
        child: Container(
          width: 310,
          height: 170,
          child : Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ActionCard(),
                ReactionCard(),
                IconButton(
                  icon: Image.asset('img/remove.png'),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        ),
      ),
      );
  }
}

class ActionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionCard();
  }
}

class _ActionCard extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_action_card,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Action", 25, Colors.white),
            Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText("Si il fait 30 degrès", 18, Colors.white),
            ),
            ),
          ],
      ),
    );
  }
}

class ReactionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReactionCard();
  }
}

class _ReactionCard extends State<ReactionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_reaction_card,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Reaction", 25, Colors.white),
            Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText("Envoie moi un mail", 18, Colors.white),
            ),
            ),
          ],
      ),
    );
  }
}


