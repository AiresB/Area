class BufferUser {
  var error;
  var message;
  var id;
  var username;
  var email;
  var google;

  BufferUser.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferUser.fromJson(Map<String, dynamic> json)
      : error = json["error"],
        id = json["user"]["id"],
        username = json["user"]["username"],
        email = json["user"]["email"],
        google = json["user"]["google"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'id': id,
        'username': username,
        'email': email,
        'google': google,
      };
}

class BufferArea {
  var error;
  var message;
  var userArea;

  BufferArea.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferArea.fromJson(Map<String, dynamic> json)
      : error = json["error"],
        userArea = json["areas"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'userArea': userArea,
      };
}

class BufferAction {
  var error;
  var message;
  var cardAction;

  BufferAction.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferAction.fromJson(Map<String, dynamic> json)
      : cardAction = json["actions"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'cardAction': cardAction as String,
      };
}

class BufferReaction {
  var error;
  var message;
  var cardReaction;

  BufferReaction.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferReaction.fromJson(Map<String, dynamic> json)
      : cardReaction = json["reactions"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'cardReaction': cardReaction as String,
      };
}
