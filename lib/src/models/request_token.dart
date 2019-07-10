class RequestToken {
  String expires_at;
  String request_token;

  RequestToken(
    this.expires_at,
    this.request_token,
  );

  RequestToken.fromJson(Map<String, dynamic> json)
      : this.expires_at = json['expires_at'],
        this.request_token = json['request_token'];
}

