class RequestTokenError {
  String status_message;
  int status_code;

  RequestTokenError(
    this.status_message,
    this.status_code,
  );

  RequestTokenError.fromJson(Map<String, dynamic> json)
      : this.status_message = json['status_message'],
        this.status_code = json['status_code'];
}
