import 'package:area/bufferResponse.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:8080';
    else
      return 'http://localhost:8080';
  }

  Future<BufferResponse> login(email, password) async {
    var url = _localhost() + '/user/login';
    Map<String, dynamic> json = {
      'email': email,
      'password': password,
    };
    final response = await http.post(url, body: json);
    if (response.statusCode == 200)
      return BufferResponse.fromJsonUser(jsonDecode(response.body));
    else
      return BufferResponse.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferResponse> register(username, password, email) async {
    Map<String, dynamic> json = {
      'username': username,
      'password': password,
      'email': email,
    };
    var url = _localhost() + '/user/register';
    final response = await http.post(url, body: json);
    if (response.statusCode == 201)
      return BufferResponse.fromJsonUser(jsonDecode(response.body));
    else
      return BufferResponse.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferResponse> getArea(userId) async {
    Map<String, dynamic> json = {
      'userId': userId,
    };
    var url = _localhost() + '/user/getbyid';
    final response = await http.get(json);
    print(json);
    print(response.body);
    if (response.statusCode == 201)
      return BufferResponse.fromJsonArea(jsonDecode(response.body));
    else
      return BufferResponse.fromJsonError(jsonDecode(response.body));
  }
}