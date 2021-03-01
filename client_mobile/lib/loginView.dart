import 'package:area/authService.dart';
import 'package:area/Data.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:provider/provider.dart';

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
              WidgetTextField(sentence: "Adresse mail", function: context.read<Data>().ChangeEmail),
              WidgetTextFieldPassword(sentence: "Mot de passe", function: context.read<Data>().ChangePassword),
              WidgetConnectionHome(),
              WidgetFlatButton("Se créer un compte", "/register", 50, 20, 15, 200),
              WidgetFlatButton("Mot de passe oublié ?", "/reset_password", 50, 20, 15, 200),
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
            if (context.read<Data>().GetEmail() != null && context.read<Data>().GetPassword() != null) {
            AuthService().login(context.read<Data>().GetEmail(),
                                context.read<Data>().GetPassword()).then((val) {
              if (val.error == false) {
                context.read<Data>().ChangeUser(val.username);
                context.read<Data>().ChangeEmail(val.email);
                context.read<Data>().ChangeGoogle(val.google);
                context.read<Data>().ChangeId(val.id);
                AuthService().getArea(context.read<Data>().GetId()).then((val) {
                  print("Area user : ");
                  print(val.userArea);
                  context.read<Data>().ChangeUserArea(val.userArea);
                  Navigator.of(context).pushNamed("/home");
                });
              }
              else
                _showMyDialog(val.message);
            });
            }
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