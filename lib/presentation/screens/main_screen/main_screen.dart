import 'package:flutter/material.dart';
import 'package:movie_db/app/constants.dart';
import 'package:movie_db/presentation/screens/main_screen/widgets/movie_delegate_list.dart';
import 'package:movie_db/presentation/screens/main_screen/widgets/rounded_bottom_bar.dart';
import 'package:movie_db/resources/color_manager/color_manager.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../../../domain/models/models.dart';
import '../../../resources/route_manager/route_manager.dart';
import '../../view_models/main_screen_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer<MainScreenViewModel>(
          builder: (context, viewModel, child) => Padding(
            padding: const EdgeInsets.all(20),
            child:viewModel.selectedIndex==1?Row(
              children: [
                const Text(
                  'Watch',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    viewModel.toggleSearchMode();
                    if (viewModel.isSearchMode) {
                      showSearch(
                        context: context,
                        delegate: MovieSearchDelegate(viewModel.movies,viewModel),
                      );
                    }
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ):const SizedBox(),
          ),
        ),
      ),
      body: Container(
        color: ColorManager.lightGreyShadeBackgroundColor,
        child: Consumer<MainScreenViewModel>(
          builder: (context, viewModel, child) =>
          viewModel.isSearchMode ? _buildSearchResults(context, viewModel) : viewModel.getScreens(),
        ),
      ),
      bottomNavigationBar: Consumer<MainScreenViewModel>(
        builder: (context, viewModel, child) => RoundedBottomNavBar(
          viewModel: viewModel,
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, MainScreenViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: viewModel.isTypingQuery ? _buildListView(viewModel) : _buildGridView(viewModel),
    );
  }

  Widget _buildGridView(MainScreenViewModel viewModel) {
    if (viewModel.filteredMovies.isEmpty) {
      return const Center(
        child: Text('No movies found'),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: viewModel.filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = viewModel.filteredMovies[index];
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${Constants.imageBaseUrl}${movie.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }


  Widget _buildListView(MainScreenViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = viewModel.filteredMovies[index];
        return ListTile(
          leading: Image.network('${Constants.imageBaseUrl}${movie.posterPath}'),
          title: Text(movie.title),
          onTap: () {
           Navigator.pushNamed(context, Routes.movieDetailsRoute,arguments: movie);
          },
        );
      },
    );
  }
}
