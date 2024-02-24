// lib/domain/repository/movie_repository.dart


import '../models/models.dart';

abstract class MovieRepository {
  Future<List<Movie>> getUpcomingMovies();
  Future<MovieDetails> getMovieDetails(int movieId);
}

