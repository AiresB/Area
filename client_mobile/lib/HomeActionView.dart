import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:area/constant.dart';

class HomeActionView extends StatefulWidget {
  @override

  State<StatefulWidget> createState() {
    return new _HomeActionView();
  }
}

class _HomeActionView extends State<HomeActionView> {
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = ACTION_DATA;
    List<Widget> listItems = [];

    responseList.forEach((post) {
      listItems.add(ActionCard());
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
              Padding(padding: EdgeInsets.only(
                top: 20,
              )),
              WidgetText("Actions :", 20, Colors.white),
              Padding(padding: EdgeInsets.only(
                bottom: 20,
            )),
          ScrollingWidget(itemsData),
        ],
      ),
    );
  }
}