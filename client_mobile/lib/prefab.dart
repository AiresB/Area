import 'package:area/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:area/Data.dart';

const background = const Color(0xFF34314C);
const button = const Color(0xFF47B8E0);
const background_action_reaction_card = const Color(0xFF444064);
const background_action_card = const Color(0xFFFF7473);
const background_reaction_card = const Color(0xFF42BB73);

class WidgetImg extends StatefulWidget {
  String path;
  double widthImg;
  double heightImg;

  WidgetImg(String _path, double _widthImg, double _heightImg) {
    this.path = _path;
    this.widthImg = _widthImg;
    this.heightImg = _heightImg;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetImg(path, widthImg, heightImg);
  }
}

class _WidgetImg extends State<WidgetImg> {
  String path;
  double widthImg;
  double heightImg;

  _WidgetImg(String _path, double _widthImg, double _heightImg) {
    this.path = _path;
    this.widthImg = _widthImg;
    this.heightImg = _heightImg;
  }

  @override
  Widget build(BuildContext context) {
    return new Image.asset(
      path,
      width: widthImg,
      height: heightImg,
    );
  }
}

class WidgetText extends StatefulWidget {
  String sentence;
  double fontSize;
  var color;

  WidgetText(String _sentence, double _fontSize, var _color) {
    this.sentence = _sentence;
    this.fontSize = _fontSize;
    this.color = _color;
  }

  @override
    State<StatefulWidget> createState() {
      return new _WidgetText(sentence, fontSize, color);
  }
}

class _WidgetText extends State<WidgetText> {
  String sentence;
  double fontSize;
  var color;

  _WidgetText(String _sentence, double _fontSize, var _color) {
    this.sentence = _sentence;
    this.fontSize = _fontSize;
    this.color = _color;
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
      sentence,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

class WidgetTextField extends StatefulWidget {
  String sentence;
  Function function;

  WidgetTextField({Key key, this.sentence, this.function}) : super(key: key);

  @override
  _WidgetTextField createState() => _WidgetTextField();
}

class _WidgetTextField extends State<WidgetTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 200,
        margin: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
        child: TextField(
          controller: _controller,
          focusNode: myFocusNode,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            labelText: widget.sentence,
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: button),   
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: background),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: button),
            ),
            labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? button : Colors.white
            ),
          ),
          onSubmitted: (value) async {
              widget.function(_controller.text.toString());
          },
        ),
    );
  }
}

class WidgetTextFieldPassword extends StatefulWidget {
  String sentence;
  Function function;

  WidgetTextFieldPassword({Key key, this.sentence, this.function}) : super(key: key);

  @override
  _WidgetTextFieldPassword createState() => _WidgetTextFieldPassword();
}

class _WidgetTextFieldPassword extends State<WidgetTextFieldPassword> {
  TextEditingController _controller;
  FocusNode myFocusNode = new FocusNode();

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 200,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        child: TextField(
          controller: _controller,
          focusNode: myFocusNode,
          obscureText: true,
          style: TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            labelText: widget.sentence,
            enabledBorder: UnderlineInputBorder(      
              borderSide: BorderSide(color: button),   
            ),  
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: background),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: button),
            ),
            labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? button : Colors.white
            ),
          ),
          onSubmitted: (value) async {
              widget.function(_controller.text.toString());
          },
        ),
      );
    }
}

class WidgetRaisedButton extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetRaisedButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetRaisedButton(sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetRaisedButton extends State<WidgetRaisedButton> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetRaisedButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      child: ButtonTheme(
        minWidth: minWidthButton,
        height: heightButton,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(path);
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            sentence,
            style: new TextStyle(
              fontSize: fontSizeText,
                color: Colors.white,
            ),
          ),
          color: button,
        ),
      ),
    );
  }
}

class WidgetFlatButton extends StatefulWidget {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  WidgetFlatButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  State<StatefulWidget> createState() {
    return new _WidgetFlatButton(sentence, path, minWidthButton, heightButton, fontSizeText);
  }
}

class _WidgetFlatButton extends State<WidgetFlatButton> {
  String sentence;
  String path;
  double minWidthButton;
  double heightButton;
  double fontSizeText;

  _WidgetFlatButton(String _sentence, String _path, double _minWidthButton, double _heightButton, double _fontSizeText) {
    this.sentence = _sentence;
    this.path = _path;
    this.minWidthButton = _minWidthButton;
    this.heightButton = _heightButton;
    this.fontSizeText = _fontSizeText;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(
        top: 5.0,
      ),
      width: 200,
      height: 40,
      color: Colors.transparent,
      child: ButtonTheme(
        minWidth: minWidthButton,
        height: heightButton,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(path);
          },
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            sentence,
            style: new TextStyle(
              fontSize: fontSizeText,
              color: button,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class ActionReactionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionReactionCard();
  }
}

class _ActionReactionCard extends State<ActionReactionCard> {
  bool deleteIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_action_reaction_card,
        child: Container(
          width: 310,
          height: 170,
          child : Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ActionCard(),
                ReactionCard(),
                IconButton(
                  icon: Image.asset('img/remove.png'),
                  iconSize: 30,
                  onPressed: () {
                    deleteIsPressed = true;
                  },
                ),
              ],
            ),
          ],
        ),
        ),
      ),
      );
  }
}

class ActionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ActionCard();
  }
}

class _ActionCard extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_action_card,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Action", 25, Colors.white),
            Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText("Si il fait 30 degrès", 18, Colors.white),
            ),
            ),
          ],
      ),
    );
  }
}

class ReactionCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReactionCard();
  }
}

class _ReactionCard extends State<ReactionCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        color: background_reaction_card,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            WidgetText("Reaction", 25, Colors.white),
            Container(
            width: 120,
            height: 120,
            child: Center(
              child: WidgetText("Envoie moi un mail", 18, Colors.white),
            ),
            ),
          ],
      ),
    );
  }
}

class ScrollingWidget extends StatefulWidget {
  List<Widget> itemsData = [];

  @override
  ScrollingWidget(List<Widget> _itemsData) {
    this.itemsData = _itemsData;
  }

  State<StatefulWidget> createState() {
    return new _ScrollingWidget(itemsData);
  }
}

class _ScrollingWidget extends State<ScrollingWidget> {
  List<Widget> itemsData = [];
  ScrollController controller = ScrollController();

  _ScrollingWidget(List<Widget> _itemsData) {
    this.itemsData = _itemsData;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
        controller: controller,
        itemCount: itemsData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return itemsData[index];
        },
      ),
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
  int selectedIndex = 0;

  BottomNavBar(int _selectedIndex) {
    selectedIndex = _selectedIndex;
  }
  @override
  _BottomNavBar createState() => _BottomNavBar(selectedIndex);
}

class _BottomNavBar extends State<BottomNavBar> {
  int selectedIndex = 0;

  _BottomNavBar(int _selectedIndex) {
    selectedIndex = _selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
    );
  }
}


