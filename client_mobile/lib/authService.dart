import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var client = http.Client();

  login(email, password) async {
    try {
      var uriResponse = await client.post('127.0.0.1:8080/register',
      body: {'name': 'doodle', 'color': 'blue'});
    } finally {
      client.close();
    }
  }

  register(username, password, email) async {
    try {
      var uriResponse = await client.post('127.0.0.1:8080/register',
      body: {'name': 'doodle', 'color': 'blue'});
    } finally {
      client.close();
    }
  }
}