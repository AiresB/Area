import 'package:flutter/material.dart';
import 'package:area/prefab.dart';

class PasswordForgetView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PasswordForgetView();
  }
}

class _PasswordForgetView extends State<PasswordForgetView> {
  var email;
  var password;
  var confirmPassword;
  bool isClicked;

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
              Padding(padding: EdgeInsets.only(
                bottom: 20,
              )),
              WidgetText("Mot de passe oublié ?", 24, Colors.white),
              WidgetTextField("Adresse mail", email),
              WidgetTextFieldPassword("Nouveau mot de passe", password),
              WidgetTextFieldPassword("Confirmer mot de passe", confirmPassword),
              WidgetRaisedButton("Réinitialiser mot de passe", "/", 200.0, 40.0, 20.0),
              WidgetFlatButton("Connectez-vous !", "/", 50, 20, 15),
              ],
            ),
          ),
        ),
      );
  }
}