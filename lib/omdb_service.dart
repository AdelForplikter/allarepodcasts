import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:allarepodcasts/auth/secrets.dart';

class OmdbService {
  final String apiKey = omdbapikey;

  Future<Map<String, dynamic>?> fetchMovie(String title) async {
    final String url = 'http://www.omdbapi.com/?t=$title&apikey=$apiKey';
    print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      print('Failed to load movie');
      return null;
    }
  }
}
