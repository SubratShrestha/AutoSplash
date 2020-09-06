import 'dart:convert';
import 'package:autoSplash/splash.dart';
import 'package:http/http.dart' as http;
import 'key.dart';

class Services {
  static const String base_url = "api.unsplash.com";
  static Future<List<Splash>> getPhotos() async {
    try {
      Key newKey = Key(baseUrl: base_url, key: null);
      newKey.getKey();

      final params = {'page': '1', 'per_page': '50'};

      final uri = Uri.http(base_url, '/photos', params);
      final response = await http.get(uri, headers: {
        'Authorization': 'Client-ID ${newKey.key}',
      });

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
