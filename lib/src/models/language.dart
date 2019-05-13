class Language {
  final String iso_639_1;
  final String name;

  Language(this.iso_639_1, this.name);

  Language.fromJson(Map<String, dynamic> parsedJson)
      : iso_639_1 = parsedJson['iso_639_1'] ?? 'en',
        name = parsedJson['name'] ?? 'English';
}

/*
  Sample response Object :

{
      "iso_639_1": "en",
      "name": "English"
    }
 */
