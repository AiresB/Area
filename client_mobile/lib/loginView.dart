import 'package:area/authService.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginView();
  }
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
  State<StatefulWidget> createState() {
    return new _WidgetFormLogin();
  }
}

class _WidgetFormLogin extends State<WidgetFormLogin> {
  var user;
  var password;
  bool isClickedAccount;
  bool isClickedPassword;

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
                child: GoogleSignInButton(onPressed: () {},
                        borderRadius: 20.0,
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                        ),
                      ),
              ),
              WidgetTextField("Adresse mail", user),
              WidgetTextFieldPassword("Mot de passe", password),
              WidgetConnectionHome(user, password),
              WidgetFlatButton("Se créer un compte", "/register", 50, 20, 15),
              WidgetFlatButton("Mot de passe oublié ?", "/reset_password", 50, 20, 15),
              ],
          ),
      ),
    );
  }
}

class WidgetConnectionHome extends StatefulWidget {
  String email;
  String password;

  WidgetConnectionHome(String _email, String _password) {
    this.email = _email;
    this.password = _password;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetConnectionHome(email, password);
  }
}

class _WidgetConnectionHome extends State<WidgetConnectionHome> {
  String email;
  String password;

  _WidgetConnectionHome(String _email, String _password) {
    this.email = _email;
    this.password = _password;
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
            print(email);
            print(password);
            AuthService().login(email, password).then((val) {
              if (val.error == false)
                Navigator.of(context).pushNamed("/home");
            });
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
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