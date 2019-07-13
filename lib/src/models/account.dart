class Account {
  int id;
  String name;
  String username;
  String iso_639_1;
  String iso_3166_1;
  bool include_adult;

  Account(
    this.id,
    this.name,
    this.username,
    this.iso_639_1,
    this.iso_3166_1,
    this.include_adult,
  );

  Account.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.username = json['username'],
        this.iso_639_1 = json['iso_639_1'],
        this.iso_3166_1 = json['iso_3166_1'],
        this.include_adult = json['include_adult'];
}
