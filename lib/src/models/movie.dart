class Movie {
  final int id;
  final String poster_path;
  final String title;

  Movie(
    this.id,
    this.poster_path,
    this.title,
  );

  Movie.fromJson(Map<String, dynamic> parsedJson)
      : this.id = parsedJson['id'],
        this.poster_path = parsedJson['poster_path'],
        this.title = parsedJson['title'];
}
