class Cast {
  int id;
  String name;
  String character;
  String profile_path;

  Cast(
    this.id,
    this.name,
    this.character,
    this.profile_path,
  );

  Cast.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.character = json['character'];
    this.profile_path = json['profile_path'];
  }
}
