import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/account.dart';
import '../models/movie.dart';
import '../models/tv.dart';

class AccountProvider with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';

  int favoritePage = 0;

  // providers data
  Account _account;
  List<Movie> _favoriteMovies = [];

  // provider getters
  Account get account => _account;
  List<Movie> get favoriteMovies => _favoriteMovies;

  Future<Null> getAccount(String sessionId) async {
    String url = _baseUrl + 'account?$_key&session_id=$sessionId';
    print('account url $url');
    http.Response response = await http.get(url);
    print('account response ${response.body}');
    Map<String, dynamic> res = json.decode(response.body);
    _account = Account.fromJson(res);
  }

  Future<bool> getFavoriteMovies(String sessionId) async {
    String url = _baseUrl +
        'account/${_account.id}/favorite/movies?$_key&session_id=$sessionId&sort_by=created_at.desc&page=${++favoritePage}';
    print('accountFavorite url $url');
    http.Response response = await http.get(url);
    Map<String, dynamic> res = json.decode(response.body);
    for(var i in res['results'])
      _favoriteMovies.add(Movie.fromJson(i));
    return true;
  }
}
