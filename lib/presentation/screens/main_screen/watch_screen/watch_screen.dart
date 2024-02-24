import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/app/constants.dart';
import 'package:movie_db/presentation/view_models/main_screen_view_model.dart';
import 'package:movie_db/presentation/view_models/watch_screen_view_model.dart';
import 'package:movie_db/resources/font_manager/font_manager.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../data/network/error_handler.dart';
import '../../../../domain/models/models.dart';
import '../../../../resources/route_manager/route_manager.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenViewModel>(
      builder: (context, viewModel, child) {
        return RefreshIndicator(
          onRefresh: () => viewModel.futureMovies,
          child: FutureBuilder<List<Movie>>(
            future: viewModel.futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingIndicator();
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return _buildMovieList(snapshot.data!, context);
              } else {
                return _buildNoDataWidget();
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget(dynamic error) {
    String errorMessage = AppStrings.noInternetError;
    if (error is NetworkException) {
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: AppSize.s50, color: Colors.grey),
            Text(errorMessage, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
    } else if (error is ServerException) {
      errorMessage = AppStrings.loadMovieError;
    }
    return Text(errorMessage);
  }

  Widget _buildMovieList(List<Movie> movies, BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(),
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.movieDetailsRoute,
                  arguments: movie);
            },
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl:
                          '${Constants.imageBaseUrl}${movie.posterPath}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: AppSize.s200,
                        ),
                      ),
                    ),
                    // Other widgets if needed
                  ],
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ],
                      ),
                      borderRadius:  BorderRadius.circular(
                       10
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          movie.title,
                          style: getRegularStyle(fontColor: Colors.white,fontWeight: FontWeight.w500,fontSize: FontSize.s20)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoDataWidget() {
    return const Center(child: Text(AppStrings.noUpcomingMovieError));
  }
}
