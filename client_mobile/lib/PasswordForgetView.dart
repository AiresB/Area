import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

class PasswordForgetView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PasswordForgetView();
  }
}

class _PasswordForgetView extends State<PasswordForgetView> {
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
              Padding(
                  padding: EdgeInsets.only(
                bottom: 20,
              )),
              WidgetText("Mot de passe oublié ?", 24, Colors.white),
              WidgetTextField(
                  sentence: "Adresse mail",
                  function: context.read<Data>().changeEmail),
              WidgetTextFieldPassword(
                  sentence: "Nouveau mot de passe",
                  function: context.read<Data>().changePassword),
              WidgetTextFieldPassword(
                  sentence: "Confirmer mot de passe",
                  function: context.read<Data>().changeConfirmPassword),
              WidgetRaisedButton(
                  "Réinitialiser mot de passe", "/", 200.0, 40.0, 20.0),
              WidgetFlatButton("Connectez-vous !", "/", 50, 20, 15, 200),
            ],
          ),
        ),
      ),
    );
  }
}
