import 'package:flutter/material.dart';
import 'package:area/auth/authService.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';
import 'package:area/prefab/TextWidget.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);
const background_action_reaction_card = const Color(0xFF444064);
const background_action_card = const Color(0xFFFF7473);
const background_reaction_card = const Color(0xFF42BB73);

class ActionReactionCard extends StatefulWidget {
  dynamic card;
  @override
  ActionReactionCard(dynamic _card) {
    this.card = _card;
  }

  State<StatefulWidget> createState() {
    return new _ActionReactionCard();
  }
}

class _ActionReactionCard extends State<ActionReactionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_reaction_card,
      child: Container(
        width: 310,
        height: 170,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ActionCard(widget.card),
                  ReactionCard(widget.card),
                  IconButton(
                    icon: Image.asset('img/remove.png'),
                    iconSize: 30,
                    onPressed: () {
                      AuthService()
                          .updateArea(
                              widget.card['id'], context.read<Data>().getId())
                          .then((val) {
                        context.read<Data>().changeUserArea(val.userArea);
                        context.read<Data>().resetCardReaction();
                        context.read<Data>().resetCardAction();
                        Navigator.of(context).pushNamed("/home");
                      });
                    },
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

class ActionReactionResultCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionReactionResultCard();
  }
}

class _ActionReactionResultCard extends State<ActionReactionResultCard> {
  bool deleteIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_reaction_card,
      child: Container(
        width: 310,
        height: 170,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ActionCardResult(),
                  ReactionCardResult(),
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
  dynamic card;
  String sentence;

  @override
  ActionCard(dynamic _card) {
    this.card = _card;
    if (card["action_id"] == "1") {
      sentence = "Hour: It's 8 o'clock'";
    }
    if (card["action_id"] == "2") {
      sentence = "Gmail: Detect a new email in the box";
    }
    if (card["action_id"] == "3") {
      sentence =
          "GCalendar: An event in the calendar is detected at this moment";
    }
    if (card["action_id"] == "4") {
      sentence = "Youtube: I got a subscriber";
    }
    if (card["action_id"] == "5") {
      sentence = "GDrive: Detect a new file into the drive";
    }
    if (card["action_id"] == "6") {
      sentence = "Weather: It's raining";
    }
    if (card["action_id"] == "7") {
      sentence = "Sunrise: We are in the sunrise hour";
    }
    if (card["action_id"] == "8") {
      sentence = "Sunset: We are in the sunset hour";
    }
    if (card["action_id"] == "9") {
      sentence = "Holidays";
    }
  }

  @override
  State<StatefulWidget> createState() {
    return new _ActionCard();
  }
}

class _ActionCard extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_card,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetText("Action", 25, Colors.white),
          Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText(widget.sentence, 18, Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ReactionCard extends StatefulWidget {
  dynamic card;
  String sentence;

  @override
  ReactionCard(dynamic _card) {
    this.card = _card;
    if (card["reaction_id"] == "1") {
      sentence = "Gmail: Send an email";
    }
    if (card["reaction_id"] == "2") {
      sentence = "GCalendar: Create an event 1 hour later";
    }
    if (card["reaction_id"] == "3") {
      sentence = "Youtube: Like the TOP 1 Popular FR video";
    }
    if (card["reaction_id"] == "4") {
      sentence = "GDrive: Comment the last file pushed into the drive";
    }
    if (card["reaction_id"] == "5") {
      sentence = "Youtube: Put the TOP 1 Popular FR video in a Playlist";
    }
    if (card["reaction_id"] == "6") {
      sentence = "GDrive: Create an empty google doc into the drive";
    }
  }
  @override
  State<StatefulWidget> createState() {
    return new _ReactionCard();
  }
}

class _ReactionCard extends State<ReactionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_reaction_card,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetText("Reaction", 25, Colors.white),
          Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText(widget.sentence, 18, Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCardResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionCardResult();
  }
}

class _ActionCardResult extends State<ActionCardResult> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_card,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetText("Action", 25, Colors.white),
          Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText(
                  context.read<Data>().getCardActionChoice(), 18, Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class ReactionCardResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReactionCardResult();
  }
}

class _ReactionCardResult extends State<ReactionCardResult> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_reaction_card,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetText("Reaction", 25, Colors.white),
          Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText(context.read<Data>().getCardReactionChoice(),
                  18, Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
