import 'package:flutter/material.dart';
import 'package:movie_db/presentation/screens/select_date_screen/select_date_screen.dart';
import '../../domain/models/models.dart';
import '../../presentation/screens/main_screen/main_screen.dart';
import '../../presentation/screens/movie_details/movie_details.dart';
import '../../presentation/screens/select_seat/select_seat_screen.dart';
import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../string_manager/app_string_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String mainRoute = '/main';
  static const String movieDetailsRoute = '/movieDetails';
  static const String dashBoardScreen = '/dashBoard';
  static const String selectDateRoute = '/selectDate';
  static const String selectSeatRoute = '/selectSeat';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.movieDetailsRoute:
        final args = routeSettings.arguments;
        if (args is Movie) {
          return MaterialPageRoute(
              builder: (_) => MovieDetailsScreen(movie: args));
        }
        return unDefinedRoute();

      case Routes.selectDateRoute:
        final args = routeSettings.arguments;
        if (args is Movie) {
          return MaterialPageRoute(
              builder: (_) => SelectDateScreen(
                    movie: args,
                  ));
        }
        return unDefinedRoute();
      case Routes.selectSeatRoute:
        final args = routeSettings.arguments;
        if (args is Movie) {
          return MaterialPageRoute(
              builder: (_) => SelectSeatScreen(
                movie: args,
              ));
        }
        return unDefinedRoute();
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoute),
              ),
              body: const Center(child: Text(AppStrings.noRoute)),
            ));
  }
}
