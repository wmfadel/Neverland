import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/tv.dart';
import '../constants.dart';

class TVProvider extends ChangeNotifier{
  bool isLoadingAiring = false;
  List<Tv> _airingToday = [];
  int airingPage = 0;

  bool isLoadingPopular = false;
  List<Tv> _popular = [];
  int popularPage = 0;


  bool isLoadingTop = false;
  List<Tv> _topRated = [];
  int topRatedPage = 0;


  List<Tv> get airingToday => _airingToday;
  List<Tv> get popular => _popular;
  List<Tv> get topRated => _topRated;

  Future<bool> getAiringTv() async{
    if (!isLoadingAiring && _airingToday.length <= 50) {
      isLoadingAiring = true;
      notifyListeners();
      final String url =
          '${Constants.baseUrl}tv/airing_today?${Constants.key}&page=${++airingPage}';
      print('tv air url $url');
      http.Response response = await http.get(url);
      print('tv air response ${response.body}');
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _airingToday.add(Tv.fromJson(i));
      }
      print('tv air count ${_airingToday.length}');
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
          '${Constants.baseUrl}tv/popular?${Constants.key}&page=${++popularPage}';
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _popular.add(Tv.fromJson(i));
      }
      isLoadingPopular = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  Future<bool> getTopRatedTv() async{
    if (!isLoadingTop && _popular.length <= 100) {
      isLoadingTop = true;
      notifyListeners();
      final String url =
          '${Constants.baseUrl}tv/top_rated?${Constants.key}&page=${++topRatedPage}';
      http.Response response = await http.get(url);
      var res = json.decode(response.body);
      for (var i in res['results']) {
        _topRated.add(Tv.fromJson(i));
      }
      isLoadingTop = false;
      notifyListeners();
      return true;
    }
    return true;
  }

  
}
