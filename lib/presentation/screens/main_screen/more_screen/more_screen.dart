import 'package:flutter/cupertino.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("MoreScreen",style: getBoldStyle(),),);
  }
}
