import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/request_token.dart';
import '../models/request_token_error.dart';

class Authentication with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';
  RequestToken _requestToken;
  RequestTokenError _requestTokenError;

  RequestToken get requestToken => _requestToken;

  RequestTokenError get requestTokenError => _requestTokenError;

  Future<bool> getRequestToken() async {
    if(_requestToken !=null)
      return true;
    String url = _baseUrl + 'authentication/token/new?$_key';
    print('token url : $url');
    http.Response response = await http.get(url);
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
}
