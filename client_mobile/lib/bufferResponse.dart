class BufferResponse {
  var error;
  var message;
  var id;
  var username;
  var email;
  var google;
  var userArea;
  var cardAction;
  var cardReaction;

  BufferResponse(this.error, this.message);

  BufferResponse.fromJsonError(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"];
  BufferResponse.fromJsonUser(Map<String, dynamic> json)
      : error = json["error"],
        id = json["user"]["id"],
        username = json["user"]["username"],
        email = json["user"]["email"],
        google = json["user"]["google"];
  BufferResponse.fromJsonArea(Map<String, dynamic> json)
      : error = json["error"],
        userArea = json["areas"];
  BufferResponse.fromJsonCardAction(Map<String, dynamic> json)
      : cardAction = json["actions"];
  BufferResponse.fromJsonCardReaction(Map<String, dynamic> json)
      : cardReaction = json["reactions"];

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'id': id,
        'username': username,
        'email': email,
        'google': google,
        'userArea': userArea,
        'cardAction': cardAction,
        'cardReaction': cardReaction,
      };
}
