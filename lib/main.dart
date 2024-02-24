import 'package:flutter/material.dart';
import 'package:movie_db/presentation/view_models/main_screen_view_model.dart';
import 'package:movie_db/presentation/view_models/select_date_view_model.dart';
import 'package:movie_db/presentation/view_models/select_seat_view_model.dart';
import 'package:movie_db/presentation/view_models/watch_screen_view_model.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenViewModel(),),
        ChangeNotifierProvider(create: (_) => WatchScreenViewModel(),),
        ChangeNotifierProvider(create: (_) => SelectDateViewModel(),),
        ChangeNotifierProvider(create: (_) => SelectSeatViewModel(),)
      ],
      child: MyApp(),
    ),
  );
}


