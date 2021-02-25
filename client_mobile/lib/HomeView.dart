import 'package:flutter/material.dart';
import 'package:area/prefab.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeView();
  }
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 40),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderWidget(),
              Padding(padding: EdgeInsets.only(
                top: 20,
              )),
              WidgetText("Vos widgets personnalisés :", 20, Colors.white),
              Padding(padding: EdgeInsets.only(
                bottom: 20,
              )),
              ActionReactionCard(),
              ActionReactionCard(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );
  }
}
class HeaderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HeaderWidget();
  }
}

class _HeaderWidget extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetImg("img/logo.png", 70, 70),
        Padding(padding: EdgeInsets.only(
          left: 50,
        )),
        WidgetText("Bonjour Alain !", 24, Colors.white),
      ]
    );
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Service',
      style: optionStyle,
    ),
    Text(
      'Index 2: Quit',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: button,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios_sharp),
            label: 'Quit',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
    );
  }
}


