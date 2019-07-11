class AuthModel {
  String expires_at;
  String request_token;

  AuthModel(this.expires_at, this.request_token);

  AuthModel.fromJson(Map<String, dynamic> json)
      : this.expires_at = json['expires_at'],
        this.request_token = json['request_token'];
}
