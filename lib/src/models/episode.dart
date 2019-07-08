class Episode {
  int id;
  String air_date;
  int episode_number;
  String name;
  String overview;
  int season_number;
  String still_path;
  double vote_average;

  Episode(
    this.id,
    this.air_date,
    this.episode_number,
    this.name,
    this.overview,
    this.season_number,
    this.still_path,
    this.vote_average,
  );

  Episode.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.air_date = json['air_date'],
        this.episode_number = json['season_number'],
        this.name = json['name'],
        this.overview = json['overview'],
        this.season_number = json['episode_number'],
        this.still_path = json['still_path'],
        this.vote_average = json['vote_average'];
}
