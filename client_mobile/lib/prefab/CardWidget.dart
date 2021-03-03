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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ActionCard(),
                  ReactionCard(),
                  IconButton(
                    icon: Image.asset('img/remove.png'),
                    iconSize: 30,
                    onPressed: () {
                      AuthService()
                          .updateArea(
                              widget.card['id'], context.read<Data>().getId())
                          .then((val) {
                        context.read<Data>().changeUserArea(val.userArea);
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
                  ActionCard(),
                  ReactionCard(),
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
              child: WidgetText("Envoie moi un mail", 18, Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
