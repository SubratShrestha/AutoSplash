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
  String full;
  int height;
  int width;
  String color;

  Splash({this.thumb, this.height, this.width, this.color, this.full});

  factory Splash.fromJson(Map<String, dynamic> json) {
    return Splash(
      thumb: json['urls']['small'] as String,
      full: json['urls']['full'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
      color: json['color'] as String,
    );
  }
}
