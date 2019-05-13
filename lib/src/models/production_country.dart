class ProductionCountry {
  final String iso_3166_1;
  final String name;

  ProductionCountry(this.iso_3166_1, this.name);

  ProductionCountry.fromJson(Map<String, dynamic> parsedJson)
      : iso_3166_1 = parsedJson['iso_3166_1'] ?? 'en',
        name = parsedJson['name'] ?? 'English';
}

/*
  Sample response Object :
 {
  "iso_3166_1": "US",
  "name": "United States of America"
  }
 */
