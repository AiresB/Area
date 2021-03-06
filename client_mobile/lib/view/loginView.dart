import 'package:area/auth/authService.dart';
import 'package:area/Data.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab/Prefab.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:area/prefab/ButtonWidget.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);

class LoginFirebase extends StatefulWidget {
  @override
  _LoginFirebase createState() => _LoginFirebase();
}

class _LoginFirebase extends State<LoginFirebase> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return LoginView();
        });
  }
}

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 60),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WidgetImg("img/logo.png", 100, 100),
              WidgetText("Area", 24, Colors.white),
              WidgetFormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetFormLogin extends StatefulWidget {
  @override
  _WidgetFormLogin createState() => _WidgetFormLogin();
}

class _WidgetFormLogin extends State<WidgetFormLogin> {
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
        'https://www.googleapis.com/auth/drive',
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
    return new Container(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width,
      color: background,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 60),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: GoogleSignInButton(
                onPressed: () {
                  signInWithGoogle().then((User user) {
                    AuthService()
                        .loginGoogle(user.email, accesToken)
                        .then((val) {
                      if (val.error == false) {
                        context.read<Data>().changeUser(user.displayName);
                        context.read<Data>().changeEmail(user.email);
                        context.read<Data>().changeGoogle(val.google);
                        context.read<Data>().changeId(val.id);
                        context.read<Data>().setAuth(firebase);
                        context.read<Data>().setObjGoogle(googlesignIn);
                        AuthService()
                            .getArea(context.read<Data>().getId())
                            .then((val) {
                          context.read<Data>().changeUserArea(val.userArea);
                          Navigator.of(context).pushNamed("/home");
                        });
                      } else {
                        AuthService()
                            .registerGoogle(
                                user.displayName, accesToken, user.email)
                            .then((val) {
                          if (val.error == false) {
                            context.read<Data>().changeUser(user.displayName);
                            context.read<Data>().changeEmail(user.email);
                            context.read<Data>().changeGoogle(val.google);
                            context.read<Data>().changeId(val.id);
                            context.read<Data>().setAuth(firebase);
                            context.read<Data>().setObjGoogle(googlesignIn);
                            Navigator.of(context).pushNamed("/home");
                          } else {
                            print("Error");
                          }
                        });
                      }
                    });
                  }).catchError((e) => print(e));
                },
                borderRadius: 20.0,
                textStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            WidgetTextField(
                sentence: "Adresse mail",
                function: context.read<Data>().changeEmail),
            WidgetTextFieldPassword(
                sentence: "Mot de passe",
                function: context.read<Data>().changePassword),
            WidgetConnectionHome(),
            WidgetFlatButton(
                "Se créer un compte", "/register", 50, 20, 15, 200),
            WidgetFlatButton(
                "Mot de passe oublié ?", "/reset_password", 50, 20, 15, 200),
          ],
        ),
      ),
    );
  }
}

class WidgetConnectionHome extends StatefulWidget {
  @override
  _WidgetConnectionHome createState() => _WidgetConnectionHome();
}

class _WidgetConnectionHome extends State<WidgetConnectionHome> {
  Future<void> _showMyDialog(String sentence) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: Text(sentence),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: ButtonTheme(
        minWidth: 200.0,
        height: 40.0,
        child: RaisedButton(
          onPressed: () {
            if (context.read<Data>().getEmail() != null &&
                context.read<Data>().getPassword() != null) {
              AuthService()
                  .login(context.read<Data>().getEmail(),
                      context.read<Data>().getPassword())
                  .then((val) {
                if (val.error == false) {
                  context.read<Data>().changeUser(val.username);
                  context.read<Data>().changeEmail(val.email);
                  context.read<Data>().changeGoogle(val.google);
                  context.read<Data>().changeId(val.id);
                  AuthService()
                      .getArea(context.read<Data>().getId())
                      .then((val) {
                    context.read<Data>().changeUserArea(val.userArea);
                    Navigator.of(context).pushNamed("/home");
                  });
                } else
                  _showMyDialog(val.message);
              });
            }
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            "Se connecter",
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          color: button,
        ),
      ),
    );
  }
}
