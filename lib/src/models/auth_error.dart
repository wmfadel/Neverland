class AuthError {
  String status_message;
  int status_code;

  AuthError(
    this.status_message,
    this.status_code,
  );

  AuthError.fromJson(Map<String, dynamic> json)
      : this.status_message = json['status_message'],
        this.status_code = json['status_code'];
}
