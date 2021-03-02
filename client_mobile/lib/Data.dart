import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  String user;
  String email;
  String password;
  String confirmPassword;
  String google;

  void PrintTest() {
    print("Hello World !");
  }

  void ResetVar() {
    user = null;
    email = null;
    password = null;
    confirmPassword = null;
    notifyListeners();
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

  List <String> GetInformation() {
    return [user, email, password, confirmPassword];
  }

  void ChangeGoogle(String val) {
    google = val;
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