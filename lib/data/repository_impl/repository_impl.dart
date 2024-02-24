

import '../../domain/models/models.dart';
import '../../domain/repository/movie_repository.dart';
import '../network/api_service.dart';

class RepositoryImpl implements MovieRepository {
  final ApiService _apiService;
  RepositoryImpl(this._apiService);

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final moviesMap = await _apiService.getUpcomingMovies();
      final List<dynamic> moviesData = moviesMap['results'] ?? [];
      final List<Movie> movies = moviesData.map((movie) {
        return Movie(
          id: movie['id'] ?? 0,
          title: movie['title'] ?? '',
          releaseDate: movie['release_date'] ?? '',
          overview: movie['overview'] ?? '',
          posterPath: movie['poster_path'] ?? '',
        );
      }).toList();
      return movies;
    } catch (e) {
      print('Error loading movies: $e');
      rethrow;
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId)async {
    try {
      final movieData = await _apiService.getMovieDetails(movieId);
      return MovieDetails.fromJson(movieData);
    } catch (e) {
      print('Error loading movie details: $e');
      rethrow;
    }
  }



}
