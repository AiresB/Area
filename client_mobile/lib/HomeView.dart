import 'package:area/HomeActionReactionView.dart';
import 'package:area/ChoiceActionReactionView.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeView();
  }
}

class _HomeView extends State<HomeView> {
  int _selectedIndex = 0;
  int statut;
  static List<Widget> _widgetView = <Widget>[
    HomeActionReactionView(),
    WidgetChoiceAction(),
    WidgetChoiceReaction(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    setState(() {
      statut = context.read<Data>().getStatut();
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
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Reactions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
