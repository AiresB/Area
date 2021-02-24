import 'package:area/authService.dart';
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
  var user;
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
              WidgetText("Se créer un compte", 24, Colors.white),
              WidgetTextField("Nom d'utilisateur", user),
              WidgetTextField("Adresse mail", email),
              WidgetTextFieldPassword("Mot de passe", password),
              WidgetTextFieldPassword("Confirmer mot de passe", confirmPassword),
              Container(
                width: 200,
                height: 60,
                child: WidgetText(
                  conditionUtil,
                  12,
                  Colors.white
                ),
              ),
              WidgetRegistrationAccount(user, email, password, confirmPassword),
              WidgetFlatButton("Connectez-vous !", "/", 50, 20, 15),
              ],
            ),
          ),
        ),
      );
  }
}

class WidgetRegistrationAccount extends StatefulWidget {
  String user;
  String email;
  String password;
  String confirmPassword;

  WidgetRegistrationAccount(String _user, String _email, String _password, String _confirmPassword) {
    this.user = _user;
    this.email = _email;
    this.password = _password;
    this.confirmPassword = _confirmPassword;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRegistrationAccount(user, email, password, confirmPassword);
  }
}

class _WidgetRegistrationAccount extends State<WidgetRegistrationAccount> {
  String user;
  String email;
  String password;
  String confirmPassword;

  _WidgetRegistrationAccount(String _user, String _email, String _password, String _confirmPassword) {
    this.user = _user;
    this.email = _email;
    this.password = _password;
    this.confirmPassword = _confirmPassword;
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
            AuthService().register(user, password, email).then((val) {
              if (val.data["error"] == false)
                Navigator.of(context).pushNamed("/");
            });
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            "S'enregister",
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