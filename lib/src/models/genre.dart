class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);

  Genre.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? -1,
        name = parsedJson['name'] ?? '';
}

/*
  Sample response Object :

 {
      "id": 18,
      "name": "Drama"
    }
 */
