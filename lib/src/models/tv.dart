class Tv {
  int id;
  String name;
  String overview;
  String poster_path;
  String backdrop_path;
  double popularity;
  String first_air_date;
  int vote_count;
  String original_language;

  Tv(
      this.id,
      this.name,
      this.overview,
      this.poster_path,
      this.backdrop_path,
      this.popularity,
      this.first_air_date,
      this.vote_count,
      this.original_language);

  Tv.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.overview = json['overview'];
    this.poster_path = json['poster_path'];
    this.backdrop_path = json['backdrop_path'];
    this.popularity = json['popularity'];
    this.first_air_date = json['first_air_date'];
    this.vote_count = json['vote_count'];
    this.original_language = json['original_language'];
  }
}
