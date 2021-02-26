import 'package:area/bufferResponse.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  Future<BufferResponse> login(email, password) async {
    var url = 'http://localhost:8080/user/login';
    final response = await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 201)
      return BufferResponse.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to login');
  }

  Future<BufferResponse> register(username, password, email) async {
    print("here");
    var url = 'http://localhost:8080/user/register';
    final response = await http.post(url, body: {'username': username, 'password': password, 'email': email});
    print("here 4");
    if (response.statusCode == 201) {
      print("here 2");
      return BufferResponse.fromJson(jsonDecode(response.body));
    }
    else {
      print("here 3");
      throw Exception('Failed to add register');
    }
  }
}