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
    if (context.read<Data>().getCardActionChoice() == "Hour: It's 8 o'clock") {
      widget.idActReact.add("1");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "Gmail: Detect a new email in the box") {
      widget.idActReact.add("2");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "GCalendar: An event in the calendar is detected at this moment") {
      widget.idActReact.add("3");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "Youtube: I got a subscriber") {
      widget.idActReact.add("4");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "GDrive: Detect a new file into the drive") {
      widget.idActReact.add("5");
    }
    if (context.read<Data>().getCardActionChoice() == "Weather: It's raining") {
      widget.idActReact.add("6");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "Sunrise: We are in the sunrise hour") {
      widget.idActReact.add("7");
    }
    if (context.read<Data>().getCardActionChoice() ==
        "Sunset: We are in the sunset hour") {
      widget.idActReact.add("8");
    }
    if (context.read<Data>().getCardActionChoice() == "Holidays") {
      widget.idActReact.add("9");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "Gmail: Send an email") {
      widget.idActReact.add("1");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "GCalendar: Create an event 1 hour later") {
      widget.idActReact.add("2");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "Youtube: Like the TOP 1 Popular FR video") {
      widget.idActReact.add("3");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "GDrive: Comment the last file pushed into the drive") {
      widget.idActReact.add("4");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "Youtube: Put the TOP 1 Popular FR video in a Playlist") {
      widget.idActReact.add("5");
    }
    if (context.read<Data>().getCardReactionChoice() ==
        "GDrive: Create an empty google doc into the drive") {
      widget.idActReact.add("6");
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
                    widget.idActReact[1],
                  )
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
