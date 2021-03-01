class BufferResponse { 
    var error;
    var message;
    var id;
    var username;
    var email;
    var google;

    BufferResponse(this.error, this.message);
  
    BufferResponse.fromJsonError(Map<String, dynamic> json)
    : error = json["error"],
      message = json["message"];
    BufferResponse.fromJson(Map<String, dynamic> json)
    : error = json["error"],
      id = json["user"]["id"],
      username = json["user"]["username"],
      email = json["user"]["email"],
      google = json["user"]["google"];

    Map<String, dynamic> toJson() =>
    {
      'error': error,
      'message': message,
      'id': id,
      'username': username,
      'email': email,
      'google': google,
    };
}
