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
  var cardAction_1;
  var cardAction_2;
  var cardAction_3;
  var cardAction_4;
  var cardAction_5;

  BufferAction.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferAction.fromJson(Map<String, dynamic> json)
      : cardAction_1 = json["actions"]["1"],
        cardAction_2 = json["actions"]["2"],
        cardAction_3 = json["actions"]["3"],
        cardAction_4 = json["actions"]["4"],
        cardAction_5 = json["actions"]["5"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'cardAction_1': cardAction_1 as String,
        'cardAction_2': cardAction_2 as String,
        'cardAction_3': cardAction_3 as String,
        'cardAction_4': cardAction_4 as String,
        'cardAction_5': cardAction_5 as String,
      };
}

class BufferReaction {
  var error;
  var message;
  var cardReaction_1;
  var cardReaction_2;
  var cardReaction_3;
  var cardReaction_4;

  BufferReaction.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferReaction.fromJson(Map<String, dynamic> json)
      : cardReaction_1 = json["reactions"]["1"],
        cardReaction_2 = json["reactions"]["2"],
        cardReaction_3 = json["reactions"]["3"],
        cardReaction_4 = json["reactions"]["4"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'cardReaction_1': cardReaction_1 as String,
        'cardReaction_2': cardReaction_2 as String,
        'cardReaction_3': cardReaction_3 as String,
        'cardReaction_4': cardReaction_4 as String,
      };
}

class BufferGoogle {
  var authUrl;

  BufferGoogle.fromJson(Map<String, dynamic> json) : authUrl = json["authUrl"];

  Map<String, dynamic> toJson() => {
        'authUrl': authUrl,
      };
}
