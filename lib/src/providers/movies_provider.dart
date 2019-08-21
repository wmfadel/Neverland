// dart imports
import 'dart:async';
import 'dart:convert';

// library imports
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// files imports
import '../models/movie.dart';
import '../constants.dart';

class MoviesProvider with ChangeNotifier {
  int _playingPage = 0;
  bool isLoadingNowPlaying = false;
  int _popularPage = 0;
  bool isLoadingPopular = false;
  int _topPage = 0;
  bool isLoadingTop = false;

// movies lists
  List<Movie> _playingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _topRatedMovies = [];

  List<Movie> getNowPlayingMovies() => _playingMovies;

  List<Movie> getNPopularMovies() => _popularMovies;

  List<Movie> getTopRatedMovies() => _topRatedMovies;


// movie fetching
  Future<bool> fetchNowPlayingMovies() async {
    if (!isLoadingNowPlaying && _playingMovies.length <= 150) {
      isLoadingNowPlaying = true;
      notifyListeners();
      final String url =
          '${Constants.baseUrl}movie/now_playing?${Constants.key}&page=${++_playingPage}';
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _playingMovies.add(Movie.fromJson(i));
      }
      print(_playingMovies.length);
      isLoadingNowPlaying = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  Future<bool> fetchPopularMovies() async {
    if (!isLoadingPopular && _popularMovies.length<=150) {
      isLoadingPopular = true;
      notifyListeners();
      final String url =
          '${Constants.baseUrl}movie/popular?${Constants.key}&page=${++_popularPage}';
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _popularMovies.add(Movie.fromJson(i));
      }
      print(_popularMovies.length);
      isLoadingPopular = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  Future<bool> fetchTopRatedMovies() async {
    if (!isLoadingTop && _topRatedMovies.length <= 150) {
      isLoadingTop = true;
      notifyListeners();
      final String url = '${Constants.baseUrl}movie/top_rated?${Constants.key}&page=${++_topPage}';
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _topRatedMovies.add(Movie.fromJson(i));
      }
      print(_topRatedMovies.length);
      isLoadingTop = false;
      notifyListeners();
      return true;
    }
    return true;
  }
}
