
import 'package:area/HomeActionReactionView.dart';
import 'package:area/HomeActionView.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeView();
  }
}

class _HomeView extends State<HomeView> {
  int _selectedIndex = 0;
  static List<Widget> _widgetView = <Widget>[
    HomeActionReactionView(),
    HomeActionView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: Center(
        child: _widgetView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
    ),
  );
  }
}


