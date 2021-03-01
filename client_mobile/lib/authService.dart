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
    final response = await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 201)
      return BufferResponse.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to login');
  }

  Future<BufferResponse> register(username, password, email) async {
    print("here");
    Map<String, dynamic> json = {
      'username': username,
      'password': password,
      'email': email,
    };
    print(json);
    var url = _localhost() + '/user/register';
    print(url);
    final response = await http.post(url, body: json);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return BufferResponse.fromJson(jsonDecode(response.body));
    }
    else {
      print("here 3");
      throw Exception('Failed to add register');
    }
  }
}