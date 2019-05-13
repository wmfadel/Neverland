class ProductionCompany {
  final int id;
  final String logo_path;
  final String name;
  final String origin_country;

  ProductionCompany(this.id, this.logo_path, this.name, this.origin_country);

  ProductionCompany.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? -1,
        logo_path = parsedJson['logo_path'] ?? '',
        name = parsedJson['name'] ?? 'Unknown',
        origin_country = parsedJson['origin_country'] ?? 'US';
}

/*
  Sample response Object :

{
      "id": 508,
      "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
      "name": "Regency Enterprises",
      "origin_country": "US"
    }
 */
