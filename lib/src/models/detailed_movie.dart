import 'language.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'genre.dart';

class DetailedMovie {
  final bool adult;
  final List<Genre> genres;
  final int id;
  final String original_language;
  final String overview;
  final String popularity;
  final String poster_path;
  final List<ProductionCompany> production_companies;
  final List<ProductionCountry> production_countries;
  final String release_date;
  final List<Language> spoken_languages;
  final String title;
  final String vote_average;
  final String vote_count;
  final String homepage;
  final String imdb_id;
  final String revenue;
  final String runtime;
  final String status;
  final String tagline;

  DetailedMovie.fromJson(Map<String, dynamic> parsedJson)
      : this.adult = parsedJson['adult'] ?? false,
        this.genres = _getGenres(parsedJson['genres']) ?? [],
        this.homepage = parsedJson['homepage'] ?? '',
        this.id = parsedJson['id'] ?? -1,
        this.imdb_id = parsedJson['imdb_id'] ?? '',
        this.original_language = parsedJson['original_language'] ?? '',
        this.overview = parsedJson['overview'] ?? '',
        this.popularity = parsedJson['popularity'].toString() ?? '',
        this.poster_path = parsedJson['poster_path'] ?? '',
        this.production_companies =
            _getCompanies(parsedJson['production_companies']) ?? [],
        this.production_countries =
            _getCountries(parsedJson['production_countries']) ?? [],
        this.release_date = parsedJson['release_date'] ?? '',
        this.revenue = parsedJson['revenue'].toString() ?? '',
        this.runtime = parsedJson['runtime'].toString() ?? '',
        this.spoken_languages =
            _getLanguages(parsedJson['spoken_languages']) ?? [],
        this.status = parsedJson['status'] ?? 'Unknown',
        this.tagline = parsedJson['tagline'] ?? '',
        this.title = parsedJson['title'] ?? '',
        this.vote_average = parsedJson['vote_average'].toString() ?? 0.0,
        this.vote_count = parsedJson['vote_count'].toString() ?? -1;

  static _getGenres(var jsonList) {
    List<Genre> mList = [];
    for (var i in jsonList) {
      mList.add(Genre.fromJson(i));
    }
    return mList;
  }

  static _getCompanies(var jsonList) {
    List<ProductionCompany> mList = [];
    for (var i in jsonList) {
      mList.add(ProductionCompany.fromJson(i));
    }
    return mList;
  }

  static _getCountries(var jsonList) {
    List<ProductionCountry> mList = [];
    for (var i in jsonList) {
      mList.add(ProductionCountry.fromJson(i));
    }
    return mList;
  }

  static _getLanguages(var jsonList) {
    List<Language> mList = [];
    for (var i in jsonList) {
      mList.add(Language.fromJson(i));
    }
    return mList;
  }
}
