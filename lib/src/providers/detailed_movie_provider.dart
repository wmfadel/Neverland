import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/detailed_movie.dart';
import '../constants.dart';

class DetailedMovieProvider with ChangeNotifier {
  bool isLoading = false;
  DetailedMovie _movie;

  DetailedMovie get movie => _movie;


  Future<bool> getMovieDetails(int id) async {
    if (!isLoading) {
      isLoading = true;
      String url = '${Constants.baseUrl}movie/$id?${Constants.key}&append_to_response=credits';
      print('movie url $url');
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
