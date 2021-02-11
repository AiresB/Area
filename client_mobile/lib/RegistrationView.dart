import 'package:flutter/material.dart';
import 'package:area/prefab.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RegistrationView();
  }
}

class _RegistrationView extends State<RegistrationView> {
  String conditionUtil = "En cliquant sur le bouton d'inscription, vous acceptez les Conditions générales d'utilisation de AREA";

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
              WidgetText("Se créer un compte", 24, Colors.white),
              WidgetTextField("Nom d'utilisateur"),
              WidgetTextField("Adresse mail"),
              WidgetTextFieldPassword("Mot de passe"),
              WidgetTextFieldPassword("Confirmer mot de passe"),
              Container(
                width: 200,
                height: 60,
                child: WidgetText(
                  conditionUtil,
                  12,
                  Colors.white
                ),
              ),
              WidgetRaisedButton("S'enregister", "/", 200.0, 40.0, 20.0),
              WidgetFlatButton("Connectez-vous !", "/", 50, 20, 15),
              ],
            ),
          ),
        ),
      );
  }
}