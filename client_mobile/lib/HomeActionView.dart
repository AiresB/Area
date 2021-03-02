import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:area/constant.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';
import 'package:area/authService.dart';

class HomeActionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeActionView();
  }
}

class _HomeActionView extends State<HomeActionView> {
  List<Widget> itemsData = [];

  void getPostsData() {
    dynamic responseList = context.read<Data>().getCardAction();
    List<Widget> listItems = [];

    listItems.add(ActionCard());
    setState(() {
      itemsData = listItems;
    });
  }

  void initState() {
    super.initState();
    AuthService().getCardAction().then((val) {
      print(val.cardAction);
      context.read<Data>().changeCardAction(val.cardAction);
    });
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 40),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderWidget(),
          Padding(
              padding: EdgeInsets.only(
            top: 20,
          )),
          WidgetText("Actions :", 20, Colors.white),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20,
          )),
          ScrollingWidget(itemsData),
        ],
      ),
    );
  }
}
