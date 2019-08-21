import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/auth_error.dart';
import '../models/auth_model.dart';
import '../models/request_token.dart';
import '../models/request_token_error.dart';

class Authentication with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=ADD_YOUR_OWN_KEY';
  RequestToken _requestToken;
  RequestTokenError _requestTokenError;
  AuthModel _authModel;
  String _sessionId;

  String _name;
  String _pass;

  RequestToken get requestToken => _requestToken;

  RequestTokenError get requestTokenError => _requestTokenError;

  AuthModel get authModel => _authModel;

  String get name => _name;

  set name(String value) => _name = value;

  String get pass => _pass;

  set pass(String value) => _pass = value;

  String get sessionId => _sessionId;

  Future<bool> getRequestToken() async {
    bool isError = false;
    if (_requestToken != null) return true;
    String url = _baseUrl + 'authentication/token/new?$_key';
    print('token url : $url');
    http.Response response = await http.get(url).catchError((err) {
      if(err != null)
        isError = true;
    });
    if(isError) return false;
    print(response.body.toString());
    var res = json.decode(response.body);
    if (res['success']) {
      _requestToken = RequestToken.fromJson(res);
      print('token granted built requestToken');
      notifyListeners();
      return true;
    }
    _requestTokenError = RequestTokenError.fromJson(res);
    print('token NOt granted built requestTokenError');
    notifyListeners();
    return false;
  }

  Future<dynamic> login() async {
    if (requestToken == null) return false;
    String url = _baseUrl +
        'authentication/token/validate_with_login?$_key&username=$_name&password=$_pass&request_token=${_requestToken.request_token}';
    print('token url : $url');
    http.Response response = await http.post(url);
    print(' response ${response.body.toString()}');
    Map<String, dynamic> res = json.decode(response.body);
    if (res.containsKey('success') && res['success']) {
      _authModel = AuthModel.fromJson(res);
      return true;
    } else {
      return AuthError.fromJson(res);
    }
  }

  Future<bool> createSession() async {
    String url = _baseUrl +
        'authentication/session/new?$_key&request_token=${requestToken.request_token}';
    print('session url : $url');
    http.Response response = await http.get(url);
    print('session response ${response.body.toString()}');
    Map<String, dynamic> res = json.decode(response.body);
    if (res.containsKey('success') && res['success']) {
      _sessionId = res['session_id'];
      print('got session $sessionId');
      return true;
    }
    return false;
  }
}
