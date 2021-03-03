import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String id;
  String user;
  String email;
  String password;
  String confirmPassword;
  String google;
  List<dynamic> userArea;
  List<Widget> widgetArea;
  List<dynamic> cardAction = List<dynamic>();
  List<dynamic> cardReaction = List<dynamic>();
  int statut = 0;
  dynamic cardActionChoice;
  dynamic cardReactionChoice;

  void PrintTest() {
    print("Hello World !");
  }

  void resetVar() {
    id = null;
    user = null;
    email = null;
    password = null;
    confirmPassword = null;
    userArea = null;
    statut = 0;
    notifyListeners();
  }

  void resetCardAction() {
    cardAction = List<dynamic>();
    notifyListeners();
  }

  void resetCardReaction() {
    cardReaction = List<dynamic>();
    notifyListeners();
  }

  int getStatut() {
    return statut;
  }

  List<dynamic> getCardAction() {
    return cardAction;
  }

  dynamic getCardActionChoice() {
    return cardActionChoice;
  }

  dynamic getCardReactionChoice() {
    return cardReactionChoice;
  }

  List<Widget> getWidgetArea() {
    return widgetArea;
  }

  List<dynamic> getCardReaction() {
    return cardReaction;
  }

  List<dynamic> getArea() {
    return userArea;
  }

  dynamic delCardActionReaction(String val) {
    userArea.removeWhere((item) => item['id'] == val);
  }

  String getId() {
    return id;
  }

  String getGoogle() {
    return google;
  }

  String getUser() {
    return user;
  }

  String getEmail() {
    return email;
  }

  String getPassword() {
    return password;
  }

  String getConfirmPassword() {
    return confirmPassword;
  }

  void changeStatut(int val) {
    statut = val;
    notifyListeners();
  }

  void changeCardActionChoice(dynamic val) {
    cardActionChoice = val;
    notifyListeners();
  }

  void changeCardReactionChoice(dynamic val) {
    cardReactionChoice = val;
    notifyListeners();
  }

  void changeGoogle(String val) {
    google = val;
    notifyListeners();
  }

  void changeCardAction(dynamic val) {
    cardAction.add(val);
    notifyListeners();
  }

  void changeCardReaction(dynamic val) {
    cardReaction.add(val);
    notifyListeners();
  }

  void changeUserArea(List<dynamic> val) {
    userArea = val;
    notifyListeners();
  }

  void changeId(String val) {
    id = val;
    notifyListeners();
  }

  void changeUser(String val) {
    user = val;
    notifyListeners();
  }

  void changeEmail(String val) {
    email = val;
    notifyListeners();
  }

  void changePassword(String val) {
    password = val;
    notifyListeners();
  }

  void changeConfirmPassword(String val) {
    confirmPassword = val;
    notifyListeners();
  }
}
