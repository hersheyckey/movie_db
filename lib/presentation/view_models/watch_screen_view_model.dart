import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../data/network/api_service.dart';
import '../../data/network/error_handler.dart';
import '../../data/repository_impl/repository_impl.dart';
import '../../domain/models/models.dart';
import '../../domain/repository/movie_repository.dart';
import '../../resources/string_manager/app_string_manager.dart';

class WatchScreenViewModel extends ChangeNotifier{
  final ApiService _apiService = ApiService();
  late MovieRepository _repository;
  late Future<List<Movie>> futureMovies;
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  bool _isLoading = false;


  WatchScreenViewModel() {
    _repository = RepositoryImpl(_apiService);
    // futureMovies = getMovies();
  }



}