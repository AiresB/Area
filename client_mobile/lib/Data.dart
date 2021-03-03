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
  dynamic cardAction;
  dynamic cardReaction;
  int statut = 0;

  void PrintTest() {
    print("Hello World !");
  }

  T cast<T>(x) => x is T ? x : null;

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

  int getStatut() {
    return statut;
  }

  dynamic getCardAction() {
    return cardAction;
  }

  List<Widget> getWidgetArea() {
    return widgetArea;
  }

  dynamic getCardReaction() {
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

  void changeGoogle(String val) {
    google = val;
    notifyListeners();
  }

  void changeCardAction(dynamic val) {
    cardAction = val;
    notifyListeners();
  }

  void changeCardReaction(dynamic val) {
    cardReaction = val;
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
