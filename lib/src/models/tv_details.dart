import 'cast.dart';
import 'episode.dart';
import 'season.dart';

class TVDetails {
  String backdrop_path;
  String first_air_date;
  String homepage;
  int id;
  bool in_production;
  String last_air_date;
  String name;
  int number_of_episodes;
  int number_of_seasons;
  String original_language;
  String overview;
  String poster_path;
  String status;
  double vote_average;
  Episode last_episode_to_air;
  Episode next_episode_to_air;
  List<Season> seasons;
  List<Cast> cast;

  TVDetails(
    this.backdrop_path,
    this.first_air_date,
    this.homepage,
    this.id,
    this.in_production,
    this.last_air_date,
    this.name,
    this.number_of_episodes,
    this.number_of_seasons,
    this.original_language,
    this.overview,
    this.poster_path,
    this.status,
    this.vote_average,
    this.last_episode_to_air,
    this.next_episode_to_air,
    this.seasons,
    this.cast,
  );

  TVDetails.fromJson(Map<String, dynamic> json)
      : this.backdrop_path = json['backdrop_path'],
        this.first_air_date = json['first_air_date'],
        this.homepage = json['homepage'],
        this.id = json['id'],
        this.in_production = json['in_production'],
        this.last_air_date = json['last_air_date'],
        this.name = json['name'],
        this.number_of_episodes = json['number_of_episodes'],
        this.number_of_seasons = json['number_of_seasons'],
        this.original_language = json['original_language'],
        this.overview = json['overview'],
        this.poster_path = json['poster_path'],
        this.status = json['status'],
        this.vote_average = json['vote_average'],
        this.last_episode_to_air =
            Episode.fromJson(json['last_episode_to_air']),
        this.next_episode_to_air =
            Episode.fromJson(json['next_episode_to_air']),
        this.seasons = _getSeason(json['seasons']),
        this.cast = _getCast(json['credits']['cast']);

  static _getCast(var jsonList) {
    List<Cast> mList = [];
    for (var i in jsonList) {
      mList.add(Cast.fromJson(i));
    }
    return mList;
  }

  static _getSeason(var jsonList) {
    List<Season> mList = [];
    for (var i in jsonList) {
      mList.add(Season.fromJson(i));
    }
    return mList;
  }
}
