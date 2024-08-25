import 'dart:convert';
import 'package:allarepodcasts/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:allarepodcasts/auth/secrets.dart';

final movieProvider = FutureProvider<Movie>((ref) async {
  final apiKey = omdbapikey;
  String movieSearch = 'Bill Burr';
  final response = await http
      .get(Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$movieSearch'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final movie = Movie.fromJson(jsonData);
    return movie;
  } else {
    throw Exception('Failed to load movie');
  }
});
