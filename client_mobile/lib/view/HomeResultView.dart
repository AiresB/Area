import 'package:flutter/material.dart';
import 'package:area/prefab/Prefab.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:area/prefab/CardWidget.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

const button = const Color(0xFF47B8E0);

class HomeResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeResult();
  }
}

class _HomeResult extends State<HomeResult> {
  List<dynamic> post;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 40),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderWidget(),
          Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          if (context.read<Data>().getStatut() == 0)
            WidgetText("Vous n'avez pas selectionné d'action et de réaction",
                20, Colors.white)
          else if (context.read<Data>().getStatut() == 1)
            WidgetText(
                "Vous n'avez pas selectionné de réaction", 20, Colors.white)
          else
            WidgetText("Votre area personnalisé :", 20, Colors.white),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20,
          )),
          if (context.read<Data>().getStatut() == 2) HomeResultWithCard()
        ],
      ),
    );
  }
}

class HomeResultWithCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeResultWithCard();
  }
}

class _HomeResultWithCard extends State<HomeResultWithCard> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ActionReactionResultCard(),
        Padding(
            padding: EdgeInsets.only(
          bottom: 50,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetRaisedButtonResult("Confirmer", "/home", 100.0, 40.0, 20.0),
            Padding(
                padding: EdgeInsets.only(
              right: 50,
            )),
            WidgetRaisedButtonResult("Annuler", "/home", 100.0, 40.0, 20.0),
          ],
        ),
      ],
    );
  }
}

class WidgetRaisedButtonResult extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetRaisedButtonResult(String _sentence, String _path,
      double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRaisedButtonResult(
        sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetRaisedButtonResult extends State<WidgetRaisedButtonResult> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetRaisedButtonResult(String _sentence, String _path,
      double _minWidthButton, double _heightButton, double _fontSizeText) {
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
            if (path == '/home') {
              context.read<Data>().changeStatut(0);
            }
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
