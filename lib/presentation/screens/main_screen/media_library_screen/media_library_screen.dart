import 'package:flutter/material.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';

class MediaLibraryScreen extends StatelessWidget {
  const MediaLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Media Library",style: getBoldStyle(),),);
  }
}
