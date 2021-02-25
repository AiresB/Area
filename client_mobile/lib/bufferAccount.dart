class BufferReponse { 
    var error;
    var message;

    BufferReponse(this.error, this.message);
    BufferReponse.fromJson(Map<String, dynamic> json)
    : error = DateTime.parse(json["error"]),
      message = DateTime.parse(json["message"]);
}
