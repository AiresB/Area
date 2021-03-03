import 'package:flutter/material.dart';
import 'package:area/Data.dart';
import 'package:provider/provider.dart';
import 'package:area/prefab/TextWidget.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);
const background_action_reaction_card = const Color(0xFF444064);
const background_action_card = const Color(0xFFFF7473);
const background_reaction_card = const Color(0xFF42BB73);

class WidgetRaisedButton extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetRaisedButton(String _sentence, String _path, double _minWidthButton,
      double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRaisedButton(
        sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetRaisedButton extends State<WidgetRaisedButton> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetRaisedButton(String _sentence, String _path, double _minWidthButton,
      double _heightButton, double _fontSizeText) {
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
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
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
  double width;

  WidgetFlatButton(String _sentence, String _path, double _minWidthButton,
      double _heightButton, double _fontSizeText, double _width) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
    this.width = _width;
  }

  @override
  _WidgetFlatButton createState() => _WidgetFlatButton();
}

class _WidgetFlatButton extends State<WidgetFlatButton> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      width: widget.width,
      height: 40,
      color: Colors.transparent,
      child: ButtonTheme(
        minWidth: widget.minWidthButton,
        height: widget.heightButton,
        child: FlatButton(
          onPressed: () {
            if (widget.sentence == "Deconnexion")
              context.read<Data>().changeStatut(0);
            Navigator.of(context).pushNamed(widget.path);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            widget.sentence,
            style: new TextStyle(
              fontSize: widget.fontSizeText,
              color: button,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class ReactionCardButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReactionCardButton();
  }
}

class _ReactionCardButton extends State<ReactionCardButton> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_reaction_card,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          context.read<Data>().changeStatut(2);
        },
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
      ),
    );
  }
}

class ActionCardButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionCardButton();
  }
}

class _ActionCardButton extends State<ActionCardButton> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_card,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          context.read<Data>().changeStatut(1);
        },
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
      ),
    );
  }
}
