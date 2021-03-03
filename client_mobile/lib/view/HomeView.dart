import 'package:area/view/HomeActionReactionView.dart';
import 'package:area/view/ChoiceActionReactionView.dart';
import 'package:area/view/HomeResultView.dart';
import 'package:flutter/material.dart';
import 'package:area/prefab/Prefab.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';
import 'package:area/auth/authService.dart';

const button = const Color(0xFF47B8E0);

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
    HomeResult(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    AuthService().getCardAction().then((val) {
      context.read<Data>().changeCardAction(val.cardAction);
    });
    AuthService().getCardReaction().then((val) {
      context.read<Data>().changeCardReaction(val.cardReaction_1);
      context.read<Data>().changeCardReaction(val.cardReaction_2);
    });
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
        type: BottomNavigationBarType.fixed,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outlined),
            label: 'Your choice',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
