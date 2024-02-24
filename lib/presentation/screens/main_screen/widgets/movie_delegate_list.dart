import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/resources/route_manager/route_manager.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';
import '../../../../app/constants.dart';
import '../../../../domain/models/models.dart';
import '../../../view_models/main_screen_view_model.dart';


class MovieSearchDelegate extends SearchDelegate<Movie> {
  final List<Movie> movies;
  final MainScreenViewModel viewModel;

  MovieSearchDelegate(this.movies,this.viewModel);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Movie(
            id: 0,
            title: 'Default Title',
            overview: 'Default Overview',
            posterPath: 'default_poster.jpg',
            releaseDate: '2000-01-01'
        ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchResults = movies
        .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final movie = searchResults[index];
        return ListTile(
          // leading: Image.network('${Constants.imageBaseUrl}${movie.posterPath}'),
          title: Text(movie.title),
          onTap: () {
            close(context,movie);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchResults = movies.where((movie) => movie.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final movie = searchResults[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child:
              CachedNetworkImage(
                imageUrl:
                '${Constants.imageBaseUrl}${movie.posterPath}',
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
                fit: BoxFit.cover,
                width: 100,
                height: 130,
              )

            ),
            title: Text(movie.title,style: getRegularStyle(),),
            onTap: ()async {
              Navigator.pushNamed(context, Routes.movieDetailsRoute,arguments: movie);
              final movieDetails = viewModel.getMovieDetails(movie.id);
            },
          ),

        );
      },
    );
  }

  @override
  String? get searchFieldLabel => AppStrings.searchHint;
}
