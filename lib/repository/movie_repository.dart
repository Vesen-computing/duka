import 'dart:convert';

import '../constants/models/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<Movie>> fetchMovies({required String url}) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOGZhOTAwNjZkZGZmMjQ4NGY5MmE1MzM3NjNmZmU2YSIsInN1YiI6IjY0ODAzODFiOTkyNTljMDEzOTI5MjA5ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mOj2iTXpup0hztV2oBj8MVp1gOwwyYXISfj24i1DmBo'
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      final List<Movie> movies =
          results.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }
}
