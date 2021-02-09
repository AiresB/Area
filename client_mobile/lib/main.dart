import 'package:flutter/material.dart';
import 'package:area/loginView.dart';

void main() {
  runApp(new Area());
}

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Area Application",
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'QuickSand'
      ),
      debugShowCheckedModeBanner: false,
      home: new LoginView(),
    );
  }
}