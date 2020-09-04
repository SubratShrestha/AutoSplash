// class Splash {
//   int id;
//   DateTime created;
//   String description;
//   String full;
//   String thumb;

//   Splash({this.id, this.created, this.description, this.full, this.thumb});

//   factory Splash.fromJson(Map<String, dynamic> json) {
//     return Splash(
//       id: json['id'] as int,
//       created: json['created_at'] as DateTime,
//       description: json['description'] as String,
//       full: json['urls']['full'] as String,
//       thumb: json['urls']['thumb'] as String,
//     );
//   }
// }

// class Splash {
//   int id;
//   String title;
//   String url;
//   String thumb;

//   Splash({this.id, this.title, this.url, this.thumb});

//   factory Splash.fromJson(Map<String, dynamic> json) {
//     return Splash(
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumb: json['thumbnailUrl'] as String,
//     );
//   }
// }

class Splash {
  String thumb;

  Splash({this.thumb});

  factory Splash.fromJson(Map<String, dynamic> json) {
    return Splash(
      thumb: json['urls']['thumb'] as String,
    );
  }
}
