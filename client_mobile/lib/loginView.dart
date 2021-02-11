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
              WidgetTextField("Nom d'utilisateur"),
              WidgetTextFieldPassword("Mot de passe"),
              WidgetRaisedButton("Se connecter", "/home", 200.0, 40.0, 20.0),
              WidgetFlatButton("Se créer un compte", "/create_account", 50, 20, 15),
              WidgetFlatButton("Mot de passe oublié ?", "/reset_password", 50, 20, 15),
              ],
          ),
      ),
    );
  }
}
