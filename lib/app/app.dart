import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db/resources/color_manager/color_manager.dart';

import '../resources/route_manager/route_manager.dart';

class MyApp extends StatefulWidget {
    const MyApp._internal();
    static final MyApp instance =MyApp._internal();
    factory MyApp () => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.lightGreyShadeBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
    );
  }
}


