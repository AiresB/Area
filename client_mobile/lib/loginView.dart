import 'package:flutter/material.dart';
import 'package:area/prefab.dart';

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
            new Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: MediaQuery.of(context).size.width,
              color: button,
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 60),
            )],
          ),
        ),
      ),
    );
  }
}
