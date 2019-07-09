import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/tv_details.dart';

class DetailedTvProvider with ChangeNotifier {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _key = 'api_key=f05286ad9b97b7821731e08bc891a337';
  bool isLoading = false;
  TVDetails _tvDetails;

  TVDetails get tvDetails => _tvDetails;


  Future<bool> getMovieDetails(int id) async {
    if (!isLoading) {
      isLoading = true;
      String url = '${_baseUrl}tv/$id?$_key&append_to_response=credits';
      print('tv url $url');
      http.Response response = await http.get(url);
      print('tv requested');
      var res = json.decode(response.body);
      print('tv decoded');
      _tvDetails = TVDetails.fromJson(res);
      print('tv parsed');
      print(_tvDetails.name);
      isLoading = false;
      print('cast length ${_tvDetails.cast.length}');
      notifyListeners();
    }
    return true;
  }

}
