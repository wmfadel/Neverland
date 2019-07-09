class Season {
  int id;
  String name;
  String overview;
  String poster_path;
  int season_number;
  int episode_count;
  String air_date;

  Season(
    this.id,
    this.name,
    this.overview,
    this.poster_path,
    this.season_number,
    this.episode_count,
    this.air_date,
  );

  Season.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.overview = json['overview'],
        this.poster_path = json['poster_path'],
        this.season_number = json['season_number'],
        this.episode_count = json['episode_count'],
        this.air_date = json['air_date'];
}
