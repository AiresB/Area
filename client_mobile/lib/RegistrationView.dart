import 'package:area/authService.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

class RegistrationView extends StatefulWidget {
  @override
  _RegistrationView createState() => _RegistrationView();
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
              WidgetTextField(sentence: "Nom d'utilisateur", function: context.read<Data>().ChangeUser),
              WidgetTextField(sentence: "Adresse mail", function: context.read<Data>().ChangeEmail),
              WidgetTextFieldPassword(sentence: "Mot de passe", function: context.read<Data>().ChangePassword),
              WidgetTextFieldPassword(sentence: "Confirmer mot de passe", function: context.read<Data>().ChangeConfirmPassword),
              Container(
                width: 200,
                height: 60,
                child: WidgetText(
                  conditionUtil,
                  12,
                  Colors.white
                ),
              ),
              WidgetRegistrationAccount(),
              WidgetFlatButton("Connectez-vous !", "/", 50, 20, 15, 200),
              ],
            ),
          ),
        ),
      );
  }
}

class WidgetRegistrationAccount extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRegistrationAccount();
  }
}

class _WidgetRegistrationAccount extends State<WidgetRegistrationAccount> {

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
              Navigator.of(context).pushNamed("/");
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
            if (context.read<Data>().GetUser() != null &&
                context.read<Data>().GetEmail() != null &&
                context.read<Data>().GetPassword() != null &&
                context.read<Data>().GetConfirmPassword() != null) {
                AuthService().register(
                  context.read<Data>().GetUser(),
                  context.read<Data>().GetPassword(),
                  context.read<Data>().GetEmail()).then((val) {
              if (val.error == false)
                Navigator.of(context).pushNamed("/");
              else {
                _showMyDialog(val.message);
              }
            });
            }
            context.read<Data>().ResetVar();
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