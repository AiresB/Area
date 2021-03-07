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
    var url = _localhost() + '/user/login/mob/';
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

  Future<BufferUser> loginGoogle(email, google) async {
    var url = _localhost() + '/user/login/mob/';
    Map<String, dynamic> jsonGoogle = {
      'token_type': "Bearer",
      'access_token': google,
      'scope':
          "email profile https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/calendar openid https://www.googleapis.com/auth/gmail.send",
      'expires_in': "3599",
    };
    Map<String, dynamic> json = {
      'email': email,
      'google': jsonEncode(jsonGoogle),
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

  Future<BufferUser> registerGoogle(username, google, email) async {
    Map<String, dynamic> jsonGoogle = {
      'token_type': "Bearer",
      'access_token': google,
      'scope':
          "email profile https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/calendar openid https://www.googleapis.com/auth/gmail.send",
      'expires_in': "3599",
    };
    Map<String, dynamic> json = {
      'username': username,
      'google': jsonEncode(jsonGoogle),
      'email': email,
    };
    var url = _localhost() + '/user/register';
    final response = await http.post(url, body: json);
    if (response.statusCode == 201) {
      return loginGoogle(email, google);
    } else
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

  Future<BufferArea> createArea(userId, actionId, reactionId) async {
    Map<String, dynamic> json = {
      'userId': userId,
      'actionId': actionId,
      'actionDesc': "null",
      'reactionId': reactionId,
      'reactionDesc': "null",
    };
    var url = _localhost() + '/area/create';
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

  Future<BufferGoogle> getGoogleSignIn() async {
    var url = _localhost() + '/user/login/mob/google';
    final response = await http.get(url);
    return BufferGoogle.fromJson(jsonDecode(response.body));
  }

  Future<BufferUser> update(id, username, email, google) async {
    var url = _localhost() + '/user/update';
    Map<String, dynamic> jsonGoogle = {
      'token_type': "Bearer",
      'access_token': google,
      'scope':
          "email profile https://www.googleapis.com/auth/youtube https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/gmail.readonly https://www.googleapis.com/auth/calendar openid https://www.googleapis.com/auth/gmail.send",
      'expires_in': "3599",
    };
    Map<String, dynamic> json = {
      'id': id,
      'username': username,
      'email': email,
      'google': jsonEncode(jsonGoogle),
    };
    final response = await http.put(url, body: json);
    if (response.statusCode == 200)
      return loginGoogle(email, google);
    else
      return BufferUser.fromJsonError(jsonDecode(response.body));
  }
}
