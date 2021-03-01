import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String id;
  String user;
  String email;
  String password;
  String confirmPassword;
  String google;
  List <String> userArea;

  void PrintTest() {
    print("Hello World !");
  }

  void ResetVar() {
    id = null;
    user = null;
    email = null;
    password = null;
    confirmPassword = null;
    userArea = null;
    notifyListeners();
  }

  List<String> GetArea() {
    return userArea;
  }

  String GetId() {
    return id;
  }

  String GetGoogle() {
    return google;
  }

  String GetUser() {
    return user;
  }

  String GetEmail() {
    return email;
  }

  String GetPassword() {
    return password;
  }

  String GetConfirmPassword() {
    return confirmPassword;
  }

  void ChangeGoogle(String val) {
    google = val;
    notifyListeners();
  }

  void ChangeUserArea(List<String> val) {
    userArea = val;
    notifyListeners();
  }

  void ChangeId(String val) {
    id = val;
    notifyListeners();
  }

  void ChangeUser(String val) {
    user = val;
    notifyListeners();
  }

  void ChangeEmail(String val) {
    email = val;
    notifyListeners();
  }

  void ChangePassword(String val) {
    password = val;
    notifyListeners();
  }

  void ChangeConfirmPassword(String val) {
    confirmPassword = val;
    notifyListeners();
  }
}