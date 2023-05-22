import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/reponse.dart';

class MovieApi {
  final String apiKey = '1b36b0aec04cef263290e95892c672dc';
  final String baseUrl = 'https://api.themoviedb.org/3';
  late final Reponses reponse_model;

  Future<List<dynamic>> searchMovies(String query,int page) async {
    final response = await http
        .get(Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query&page=$page'));

    if (response.statusCode == 200) {
      final test = await jsonDecode(response.body);
      return test['results'];
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
