class BufferResponse { 
    var error;
    var message;

    BufferResponse(this.error, this.message);
    BufferResponse.fromJson(Map<String, dynamic> json)
    : error = json["error"],
      message = json["message"];
}
