import 'package:area/auth/bufferResponse.dart';
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

  Future<BufferUser> login(email, password) async {
    var url = _localhost() + '/user/login';
    Map<String, dynamic> json = {
      'email': email,
      'password': password,
    };
    final response = await http.post(url, body: json);
    if (response.statusCode == 200)
      return BufferUser.fromJson(jsonDecode(response.body));
    else
      return BufferUser.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferUser> register(username, password, email) async {
    Map<String, dynamic> json = {
      'username': username,
      'password': password,
      'email': email,
    };
    var url = _localhost() + '/user/register';
    final response = await http.post(url, body: json);
    if (response.statusCode == 201)
      return BufferUser.fromJson(jsonDecode(response.body));
    else
      return BufferUser.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferArea> getArea(userId) async {
    Map<String, dynamic> json = {
      'userId': userId,
    };
    var url = _localhost() + '/area/getbyid';
    final response = await http.post(url, body: json);
    if (response.statusCode == 200)
      return BufferArea.fromJson(jsonDecode(response.body));
    else
      return BufferArea.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferArea> updateArea(idArea, userId) async {
    var url = _localhost() + '/area/delete/';
    http.Request rq = http.Request('DELETE', Uri.parse(url));
    rq.bodyFields = {
      'id': idArea,
    };
    await http.Client().send(rq);
    return getArea(userId);
  }

  Future<BufferAction> getCardAction() async {
    var url = _localhost() + '/area/actionlist';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return BufferAction.fromJson(jsonDecode(response.body));
    else
      return BufferAction.fromJsonError(jsonDecode(response.body));
  }

  Future<BufferReaction> getCardReaction() async {
    var url = _localhost() + '/area/reactionlist';
    final response = await http.get(url);
    if (response.statusCode == 200)
      return BufferReaction.fromJson(jsonDecode(response.body));
    else
      return BufferReaction.fromJsonError(jsonDecode(response.body));
  }
}
