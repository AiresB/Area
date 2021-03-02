import 'package:flutter/material.dart';
import 'package:area/prefab.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

class HomeActionReactionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeActionReactionView();
  }
}

class _HomeActionReactionView extends State<HomeActionReactionView> {
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = context.read<Data>().getArea();
    List<Widget> listItems = [];

    if (responseList != null) {
      responseList.forEach((post) {
        listItems.add(ActionReactionCard(post));
      });
      setState(() {
        itemsData = listItems;
      });
    } else {
      itemsData = null;
    }
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
          WidgetText("Vos widgets personnalisés :", 20, Colors.white),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20,
          )),
          if (itemsData == null)
            WidgetText("Vous n'avez pas encore d'area", 20, Colors.white)
          else
            ScrollingWidget(itemsData),
        ],
      ),
    );
  }
}
