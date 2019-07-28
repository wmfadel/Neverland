import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/account.dart';
import '../models/movie.dart';
import '../models/tv.dart';
import '../enums/media_type.dart';

class AccountProvider with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';

  int favoritePage = 0;
  int favoriteTvPage = 0;

  // providers data
  Account _account;
  List<Movie> _favoriteMovies = [];
  List<Tv> _favoriteTv = [];

  // provider getters
  Account get account => _account;

  List<Movie> get favoriteMovies => _favoriteMovies;

  List<Tv> get favoriteTv => _favoriteTv;

  Future<Null> getAccount(String sessionId) async {
    String url = _baseUrl + 'account?$_key&session_id=$sessionId';
    print('account url $url');
    http.Response response = await http.get(url);
    print('account response ${response.body}');
    Map<String, dynamic> res = json.decode(response.body);
    _account = Account.fromJson(res);
  }

  Future<bool> getFavoriteMovies(String sessionId) async {
    if (_favoriteMovies.length > 0) return true;
    bool isLoaded = false;
    do {
      String url = _baseUrl +
          'account/${_account.id}/favorite/movies?$_key&session_id=$sessionId&sort_by=created_at.desc&page=${++favoriteTvPage}';
      print('accountFavorite url $url');
      http.Response response = await http.get(url);
      Map<String, dynamic> res = json.decode(response.body);
      for (var i in res['results']) _favoriteMovies.add(Movie.fromJson(i));
      if (res['results'].isEmpty || res['results'].length == 0) isLoaded = true;
    } while (!isLoaded);
    return true;
  }

  Future<bool> getFavoriteTvs(String sessionId) async {
    if (_favoriteTv.length > 0) return true;
    bool isLoaded = false;

    do {
      String url = _baseUrl +
          'account/${_account.id}/favorite/tv?$_key&session_id=$sessionId&sort_by=created_at.desc&page=${++favoritePage}';
      print('accountFavorite tv url $url');
      http.Response response = await http.get(url);
      Map<String, dynamic> res = json.decode(response.body);
      for (var i in res['results']) _favoriteTv.add(Tv.fromJson(i));
      if (res['results'].isEmpty || res['results'].length == 0) isLoaded = true;
    } while (!isLoaded);

    return true;
  }

  Future<dynamic> changeFavoriteMedia(
      {@required String sessionId,
      Movie movie,
      Tv tv,
      @required MediaType mediaType}) async {
    // preparing request parameters
    bool isFavorite = false;
    if (mediaType == MediaType.Movie) {
      isFavorite = _favoriteMovies.contains(movie);
    } else if (mediaType == MediaType.Tv) {
      isFavorite = _favoriteTv.contains(tv);
    } else {
      isFavorite = false;
    }

    // building request
    String url = _baseUrl +
        'account/${_account.id}/favorite?$_key&session_id=$sessionId';
    Map<String, dynamic> requestBody = {
      'media_type': mediaType.toString(),
      'media_id': mediaType == MediaType.Movie ? 'movie' : 'tv',
      'favorite': !isFavorite
    };

    // requesting/parsing data
    http.Response response =
        await http.post(url, body: json.encode(requestBody));
    print('this is favorite change response ${response.body.toString()}');
    Map<String, dynamic> res = json.decode(response.body);

    // handling responses
    if (res.containsKey('status_code') && res['status_code'] == 12) {
      // status changed on server, change local status
      switch (mediaType) {
        case MediaType.Movie:
          !isFavorite
              ? _favoriteMovies.remove(movie)
              : _favoriteMovies.add(movie);
          break;
        case MediaType.Tv:
          !isFavorite ? _favoriteTv.remove(tv) : _favoriteTv.add(tv);
          break;
      }
      return true;
    } else {
      return res['status_message'];
    }
  } // end of changeFavoriteMedia


    bool isFavoriteMovie(Movie movie){
    if(_favoriteMovies == null || _favoriteMovies.isEmpty)
      return false;
      return _favoriteMovies.contains(movie);
    }


  bool isFavoriteTv(Tv tv){
    if(_favoriteTv == null || _favoriteTv.isEmpty)
      return false;
    return _favoriteTv.contains(tv);
  }

} // end of class
