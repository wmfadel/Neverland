import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/detailed_movie.dart';

class DetailedMovieProvider with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';
  bool isLoading = false;
  DetailedMovie _movie;
  int movieId;
  DetailedMovie get movie => _movie;



  Future<Null> getMovieDetails(int id) async {
    movieId = id;
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
      String url = '${_baseUrl}movie/$id?$_key';

      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      _movie = DetailedMovie.fromJson(res);
      print(_movie.title);
      isLoading = false;
      notifyListeners();
    }
  }


}
