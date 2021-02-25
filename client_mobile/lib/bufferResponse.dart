class BufferResponse { 
    var error;
    var message;

    BufferResponse(this.error, this.message);
    BufferResponse.fromJson(Map<String, dynamic> json)
    : error = DateTime.parse(json["error"]),
      message = DateTime.parse(json["message"]);
}
