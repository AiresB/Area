import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:area/loginView.dart';
import 'package:area/PasswordForgetView.dart';
import 'package:area/RegistrationView.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LoginView()
        );
      case '/create_account':
        return MaterialPageRoute(
          builder: (_) => RegistrationView()
        );
      case '/reset_password':
        return MaterialPageRoute(
          builder: (_) => PasswordForgetView()
        );
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => LoginView()
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: button,
          title: Text('Error'),
        ),
        body: Center(
          child: Container(
            color: background,
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(
                    bottom: 20,
                  )),
                  WidgetImg("img/logo.png", 100, 100),
                  WidgetText("Area", 24, Colors.white),
                  Padding(padding: EdgeInsets.only(
                    bottom: 150,
                  )),
                  WidgetText("La page que vous demandez d'afficher n'existe pas !", 24, Colors.red),
                ],
              ),
            ),
        ),
        ),
      );
    });
}