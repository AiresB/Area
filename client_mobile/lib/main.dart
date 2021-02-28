import 'package:area/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Data()),
      ],
      child: Area(),
    ),
  );
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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}