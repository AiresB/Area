import 'package:flutter/material.dart';
import 'package:area/prefab/Prefab.dart';
import 'package:area/prefab/ButtonWidget.dart';
import 'package:area/prefab/TextWidget.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

class WidgetChoiceAction extends StatefulWidget {
  @override
  _WidgetChoiceAction createState() => _WidgetChoiceAction();
}

class _WidgetChoiceAction extends State<WidgetChoiceAction> {
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = context.read<Data>().getCardAction();
    List<Widget> listItems = [];

    responseList.forEach((post) {
      listItems.add(ActionCardButton(post));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  void initState() {
    super.initState();
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

class WidgetChoiceReaction extends StatefulWidget {
  @override
  _WidgetChoiceReaction createState() => _WidgetChoiceReaction();
}

class _WidgetChoiceReaction extends State<WidgetChoiceReaction> {
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = context.read<Data>().getCardReaction();
    List<Widget> listItems = [];

    responseList.forEach((post) {
      listItems.add(ReactionCardButton(post));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  void initState() {
    super.initState();
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
          WidgetText("Reactions :", 20, Colors.white),
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
