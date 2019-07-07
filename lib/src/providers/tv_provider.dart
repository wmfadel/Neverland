import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/tv.dart';

class TVProvider extends ChangeNotifier{
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';
  bool isLoadingAiring = false;
  List<Tv> _airingToday = [];
  int airingPage = 0;

  bool isLoadingPopular = false;
  List<Tv> _popular = [];
  int popularPage = 0;


  List<Tv> get airingToday => _airingToday;
  List<Tv> get popular => _popular;

  Future<bool> getAiringTv() async{
    if (!isLoadingAiring && _airingToday.length <= 50) {
      isLoadingAiring = true;
      notifyListeners();
      final String url =
          '${_baseUrl}tv/airing_today?$_key&page=${++airingPage}';
      print('series url: $url');
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _airingToday.add(Tv.fromJson(i));
      }
      print(_airingToday.length);
      isLoadingAiring = false;
      notifyListeners();
      return true;
    }
    return true;
  }


  Future<bool> getPopularTv() async{
    if (!isLoadingPopular && _popular.length <= 100) {
      isLoadingPopular = true;
      notifyListeners();
      final String url =
          '${_baseUrl}tv/popular?$_key&page=${++popularPage}';
      print('popular series url: $url');
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _popular.add(Tv.fromJson(i));
      }
      print(_popular.length);
      isLoadingPopular = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  
}