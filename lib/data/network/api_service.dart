// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_db/app/constants.dart';

class ApiService {


  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}/movie/upcoming?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}/movie/$movieId?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<Map<String, dynamic>> getMovieImages(int movieId) async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}movie/$movieId/images?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie images');
    }
  }
}
