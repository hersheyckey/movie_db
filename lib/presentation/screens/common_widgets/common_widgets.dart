import 'package:flutter/material.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';

import '../../../resources/color_manager/color_manager.dart';
import '../../../resources/values_manager/values_manager.dart';

AppBar getAppBar(BuildContext context,movie) {
  return AppBar(
    centerTitle: true,
    leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios)),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(movie.title, style: getRegularStyle()),
        const SizedBox(height: AppSize.s4),
        Text(
          "In theaters ${movie.releaseDate}",
          style: getRegularStyle(fontColor: ColorManager.lightBlue),
        ),
      ],
    ),
  );
}