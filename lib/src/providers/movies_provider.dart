// dart imports
import 'dart:async';
import 'dart:convert';

// library imports
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// files imports
import '../models/movie.dart';

class MoviesProvider with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';
  int _playingPage = 0;
  bool isLoadingNowPlaying = false;
  int _popularPage = 0;
  bool isLoadingPopular = false;
  int _topPage = 0;
  bool isLoadingTop = false;

  List<Movie> _playingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _topRatedmovies = [];

  List<Movie> getNowPlayingMovies() => _playingMovies;
  List<Movie> getNPopularMovies() => _popularMovies;
  List<Movie> getTopRatedMovies() => _topRatedmovies;

  Future<bool> fetchNowPlayingMovies() async {
    if (!isLoadingNowPlaying) {
      isLoadingNowPlaying = true;
      notifyListeners();
      final String url =
          '${_baseUrl}movie/now_playing?$_key&page=${++_playingPage}';
      print(url);
      http.Response response = await http.get(url);
      print('response fteched');
      var res = json.decode(response.body);
      print('response parsed');
      for (var i in res['results']) {
        _playingMovies.add(Movie.fromJson(i));
        print(_playingMovies[_playingMovies.length - 1].title);
      }
      print('list builded');

      print(_playingMovies.length);
      isLoadingNowPlaying = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  Future<bool> fetchPopularMovies() async {
    if (!isLoadingPopular) {
      isLoadingPopular = true;
      notifyListeners();
      final String url =
          '${_baseUrl}movie/popular?$_key&page=${++_popularPage}';
      print(url);
      http.Response response = await http.get(url);
      print('response fteched');
      var res = json.decode(response.body);
      print('response parsed');
      for (var i in res['results']) {
        _popularMovies.add(Movie.fromJson(i));
        print(_popularMovies[_popularMovies.length - 1].title);
      }
      print('list builded');

      print(_popularMovies.length);
      isLoadingPopular = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  Future<bool> fetchTopRatedMovies() async {
    if (!isLoadingTop) {
      isLoadingTop = true;
      notifyListeners();
      final String url =
          '${_baseUrl}movie/top_rated?$_key&page=${++_topPage}';
      print(url);
      http.Response response = await http.get(url);
      print('response fteched');
      var res = json.decode(response.body);
      print('response parsed');
      for (var i in res['results']) {
        _topRatedmovies.add(Movie.fromJson(i));
        print(_topRatedmovies[_topRatedmovies.length - 1].title);
      }
      print('list builded');

      print(_topRatedmovies.length);
      isLoadingTop = false;
      notifyListeners();
      return true;
    }
    return true;
  }


}