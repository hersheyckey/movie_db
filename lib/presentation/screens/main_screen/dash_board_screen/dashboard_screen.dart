import 'package:flutter/material.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Dashboard Screen",style: getBoldStyle(),),
    );
  }
}
