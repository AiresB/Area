import 'package:area/bufferResponse.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  Future<BufferResponse> login(email, password) async {
    var url = 'localhost:8080/login';
    final response = await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 201)
      return BufferResponse.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to login');
  }

  Future<BufferResponse> register(username, password, email) async {
    var url = 'localhost:8080/register';
    final response = await http.post(url, body: {'username': username, 'password': password, 'email': email});
    if (response.statusCode == 201)
      return BufferResponse.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to add register');
  }
}