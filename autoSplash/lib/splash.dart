class Splash {
  int id;
  DateTime created;
  // DateTime uploaded;
  // DateTime promoted;
  // int width;
  // int height;
  // String color;
  String description;
  // String altDescription;
  // Map urls;
  // Map links;
  // List categories;
  // int likes;
  // bool likedByUser;
  // List currentUserCollections;
  String full;
  String thumb;

  Splash({this.id, this.created, this.description, this.full, this.thumb});

  factory Splash.fromJson(Map<String, dynamic> json) {
    return Splash(
      id: json['id'] as int,
      created: json['created_at'] as DateTime,
      description: json['description'] as String,
      full: json['urls']['full'] as String,
      thumb: json['urls']['thumb'] as String,
    );
  }
}
