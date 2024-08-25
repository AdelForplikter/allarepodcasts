import 'package:flutter_riverpod/flutter_riverpod.dart';

class Movie {
  final String title;
  final int? year;
  final String? type;
  final String? poster;

  const Movie({required this.title, this.year, this.type, this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: int.tryParse(json['Year']),
      type: json['Type'],
      poster: json['Poster'],
    );
  }
  // add serialization
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Year': year,
      'Type': type,
      'Poster': poster,
    };
  }
}
