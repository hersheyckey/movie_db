import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_db/resources/asset_manager/asset_manger.dart';
import 'package:movie_db/resources/route_manager/route_manager.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: AppSize.s190,
            width: AppSize.s190,
            child: SvgPicture.asset(AssetManager.splashLogo)),
      ),
    );
  }
}