import 'package:flutter/material.dart';
import 'package:area/prefab/Prefab.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:area/prefab/CardWidget.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';
import 'package:area/auth/authService.dart';

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
          if (context.read<Data>().getCardActionChoice() == null &&
              context.read<Data>().getCardReactionChoice() == null)
            WidgetText("Vous n'avez pas selectionné d'action et de réaction",
                20, Colors.white)
          else if (context.read<Data>().getCardActionChoice() == null)
            WidgetText("Vous n'avez pas selectionné d'action", 20, Colors.white)
          else if (context.read<Data>().getCardReactionChoice() == null)
            WidgetText(
                "Vous n'avez pas selectionné de reaction", 20, Colors.white)
          else
            WidgetText("Votre area personnalisé :", 20, Colors.white),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20,
          )),
          if (context.read<Data>().getCardActionChoice() != null &&
              context.read<Data>().getCardReactionChoice() != null)
            HomeResultWithCard()
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
  List<String> idActReact = List<String>();
  List<String> description = List<String>();

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
    return new _WidgetRaisedButtonResult();
  }
}

class _WidgetRaisedButtonResult extends State<WidgetRaisedButtonResult> {
  void setIdAndDescription() {
    print("card action choice :");
    print(context.read<Data>().getCardActionChoice());
    print("card reaction choice :");
    print(context.read<Data>().getCardReactionChoice());
    if (context.read<Data>().getCardActionChoice() == "It's 8'") {
      widget.idActReact.add("1");
      widget.description.add("Horaire description");
    }
    if (context.read<Data>().getCardReactionChoice() == "Gmail") {
      widget.idActReact.add("1");
      widget.description.add("Gmail description");
    }
    if (context.read<Data>().getCardReactionChoice() == "GCalendar") {
      widget.idActReact.add("2");
      widget.description.add("GCalendar description");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: ButtonTheme(
        minWidth: widget.minWidthButton,
        height: widget.heightButton,
        child: RaisedButton(
          onPressed: () {
            if (widget.sentence == "Confirmer") {
              setIdAndDescription();
              AuthService()
                  .createArea(
                      context.read<Data>().getId(),
                      widget.idActReact[0],
                      widget.description[0],
                      widget.idActReact[1],
                      widget.description[1])
                  .then((val) {});
            }
            context.read<Data>().resetCardAction();
            context.read<Data>().resetCardReaction();
            context.read<Data>().changeCardActionChoice(null);
            context.read<Data>().changeCardReactionChoice(null);
            Navigator.of(context).pushNamed(widget.path);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            widget.sentence,
            style: new TextStyle(
              fontSize: widget.fontSizeText,
              color: Colors.white,
            ),
          ),
          color: button,
        ),
      ),
    );
  }
}
