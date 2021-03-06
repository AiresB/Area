import 'package:flutter/material.dart';
import 'package:area/Data.dart';
import 'package:provider/provider.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:area/auth/authService.dart';

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
  Future<void> _signOut() async {
    if (context.read<Data>().getObjGoogle() != null) {
      await FirebaseAuth.instance.signOut();
      dynamic objGoogle = context.read<Data>().getObjGoogle();
      await objGoogle.signOut();
      context.read<Data>().setObjGoogle(null);
      context.read<Data>().setAuth(null);
    }
  }

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
            if (widget.sentence == "Deconnexion") {
              context.read<Data>().resetCardAction();
              context.read<Data>().resetCardReaction();
              context.read<Data>().changeGoogle(null);
              context.read<Data>().changeCardActionChoice(null);
              context.read<Data>().changeCardReactionChoice(null);
              _signOut();
            }
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
  dynamic card;

  @override
  ReactionCardButton(dynamic _card) {
    this.card = _card;
  }

  @override
  State<StatefulWidget> createState() {
    return new _ReactionCardButton();
  }
}

class _ReactionCardButton extends State<ReactionCardButton> {
  String accesToken;
  dynamic firebase;
  dynamic googlesignIn;

  Future<User> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile',
        'https://www.googleapis.com/auth/youtube',
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/gmail.readonly',
        'https://www.googleapis.com/auth/calendar',
        'openid',
        'https://www.googleapis.com/auth/gmail.send',
      ],
    );
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    accesToken = googleSignInAuthentication.accessToken;
    UserCredential authResult = await _auth.signInWithCredential(credential);
    final _user = authResult.user;
    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    User currentUser = _auth.currentUser;
    assert(_user.uid == currentUser.uid);
    firebase = _auth;
    googlesignIn = _googleSignIn;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_reaction_card,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          if (context.read<Data>().getObjGoogle() == null) {
            signInWithGoogle().then((User user) {
              AuthService()
                  .update(context.read<Data>().getId(),
                      context.read<Data>().getUser(), user.email, accesToken)
                  .then((val) {
                if (val.error == false) {
                  context.read<Data>().changeUser(user.displayName);
                  context.read<Data>().changeEmail(user.email);
                  context.read<Data>().changeGoogle(val.google);
                  context.read<Data>().changeId(val.id);
                  context.read<Data>().setAuth(firebase);
                  context.read<Data>().setObjGoogle(googlesignIn);
                } else {
                  print("Error");
                }
              });
            }).catchError((e) => print(e));
          }
          context.read<Data>().changeCardReactionChoice(widget.card);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Reaction", 25, Colors.white),
            Container(
              width: 120,
              height: 120,
              child: Center(
                child: WidgetText(widget.card, 18, Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCardButton extends StatefulWidget {
  dynamic card;

  @override
  ActionCardButton(dynamic _card) {
    this.card = _card;
  }

  State<StatefulWidget> createState() {
    return new _ActionCardButton();
  }
}

class _ActionCardButton extends State<ActionCardButton> {
  String accesToken;
  dynamic firebase;
  dynamic googlesignIn;

  Future<User> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile',
        'https://www.googleapis.com/auth/youtube',
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/gmail.readonly',
        'https://www.googleapis.com/auth/calendar',
        'openid',
        'https://www.googleapis.com/auth/gmail.send',
      ],
    );
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    accesToken = googleSignInAuthentication.accessToken;
    UserCredential authResult = await _auth.signInWithCredential(credential);
    final _user = authResult.user;
    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    User currentUser = _auth.currentUser;
    assert(_user.uid == currentUser.uid);
    firebase = _auth;
    googlesignIn = _googleSignIn;
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0)),
      color: background_action_card,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          if (context.read<Data>().getObjGoogle() == null) {
            signInWithGoogle().then((User user) {
              AuthService()
                  .update(context.read<Data>().getId(),
                      context.read<Data>().getUser(), user.email, accesToken)
                  .then((val) {
                if (val.error == false) {
                  context.read<Data>().changeUser(user.displayName);
                  context.read<Data>().changeEmail(user.email);
                  context.read<Data>().changeGoogle(val.google);
                  context.read<Data>().changeId(val.id);
                  context.read<Data>().setAuth(firebase);
                  context.read<Data>().setObjGoogle(googlesignIn);
                } else {
                  print("Error");
                }
              });
            }).catchError((e) => print(e));
          }
          context.read<Data>().changeCardActionChoice(widget.card);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Action", 25, Colors.white),
            Container(
              width: 120,
              height: 120,
              child: Center(
                child: WidgetText(widget.card, 18, Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
