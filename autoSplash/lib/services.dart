import 'dart:convert';
import 'package:autoSplash/splash.dart';
import 'package:http/http.dart' as http;
import 'key.dart';

class Services {
  static const String base_url = "https://api.unsplash.com/photos/?client_id=";
  static Future<List<Splash>> getPhotos() async {
    try {
      Key newKey = Key(baseUrl: base_url, key: null);
      newKey.getKey();

      // final response = await http.get(base_url + newKey.key);
      final response = await http.get(base_url + newKey.key);
      if (response.statusCode == 200) {
        print("status 200, yay!");
        List<Splash> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("parse error");
      }
    } catch (e) {
      throw new Exception(e.toString());
    }
  }

  static List<Splash> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Splash>((json) => Splash.fromJson(json)).toList();
  }
}
