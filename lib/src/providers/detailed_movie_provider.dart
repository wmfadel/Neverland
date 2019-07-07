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

  DetailedMovie get movie => _movie;


  Future<bool> getMovieDetails(int id) async {
    if (!isLoading) {
      isLoading = true;
      String url = '${_baseUrl}movie/$id?$_key&append_to_response=credits';
      print('movie url $url');
// https://api.themoviedb.org/3/movie/150540?api_key=f05286ad9b97b7821731e08bc891a337&append_to_response=credits
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      _movie = DetailedMovie.fromJson(res);
      print(_movie.title);
      isLoading = false;
      print('cast length ${_movie.cast.length}');
      notifyListeners();
    }
    return true;
  }

}
