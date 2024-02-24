import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_db/data/network/api_service.dart';
import 'package:movie_db/data/repository_impl/repository_impl.dart';
import 'package:movie_db/domain/repository/movie_repository.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import '../../../../domain/models/models.dart';
import '../../data/network/error_handler.dart';
import '../screens/main_screen/dash_board_screen/dashboard_screen.dart';
import '../screens/main_screen/media_library_screen/media_library_screen.dart';
import '../screens/main_screen/more_screen/more_screen.dart';
import '../screens/main_screen/watch_screen/watch_screen.dart';

class MainScreenViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  late MovieRepository _repository;
  late Future<List<Movie>> futureMovies;
  int selectedIndex = 1;
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  bool _isSearchMode = false;
  bool get isSearchMode => _isSearchMode;
  bool _isTypingQuery = false;
  bool get isTypingQuery => _isTypingQuery;
  bool _isLoading = false;
  List<Movie> _filteredMovies = [];
  List<Movie> get filteredMovies => _filteredMovies;

  MainScreenViewModel() {
    _repository = RepositoryImpl(_apiService);
     futureMovies = getMovies();
  }


  //get upcoming Movies
  Future<List<Movie>> getMovies() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Fetch upcoming movies using the repository
      _movies = await _repository.getUpcomingMovies();

      _isLoading = false;
      notifyListeners();

      return _movies;
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      if (e is SocketException) {
        throw NetworkException(AppStrings.noInternetError);
      } else if (e is HttpException) {
        throw ServerException('Failed to load movies: ${e.message}');
      } else {
        throw UnknownException(
            'Failed to load movies. Please try again later.');
      }
    }
  }

// Get movie details by ID
  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      // Fetch movie details using the repository
      final movieDetails = await _repository.getMovieDetails(movieId);

      // Check if the movie details are null
      if (movieDetails == null) {
        throw Exception(AppStrings.moviesNotFound);
      }

      return movieDetails;
    } catch (e) {
      if (e is SocketException) {
        throw NetworkException(AppStrings.noInternetError);
      } else if (e is HttpException) {
        throw ServerException('Failed to load movie details: ${e.message}');
      } else {
        throw UnknownException(
            'Failed to load movie details. Please try again later.');
      }
    }
  }



  //search mode active
  void toggleSearchMode() {
    _isSearchMode = !_isSearchMode;
    if (!_isSearchMode) {
      _filteredMovies.clear();
      _isTypingQuery = false;
    }
    notifyListeners();
  }

  //search Movies
  void searchMovies(String query) {
    _filteredMovies = _movies
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    _isTypingQuery = query.isNotEmpty;
    notifyListeners();
  }

  //BottomBar index
  updateSelectedIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  Widget getScreens() {
    switch (selectedIndex) {
      case 0:
        return const DashBoardScreen();
      case 1:
        return const WatchScreen();
      case 2:
        return const MediaLibraryScreen();
      case 3:
        return const MoreScreen();
      default:
        return const WatchScreen();
    }
  }
}
