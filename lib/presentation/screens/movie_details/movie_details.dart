import 'package:flutter/material.dart';
import 'package:movie_db/app/constants.dart';
import 'package:movie_db/resources/font_manager/font_manager.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';
import '../../../domain/models/models.dart';
import '../../../resources/route_manager/route_manager.dart';
class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "${Constants.imageBaseUrl}${movie.posterPath}",
                  height: AppSize.s400,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p250, left: AppPadding.p80, right: AppPadding.p80),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
        
                      children: [
                        Text(
                          "${AppStrings.inTheaters} ${movie.releaseDate}",
                          style: getBoldStyle(fontColor: Colors.white, fontSize:FontSize.s16,),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.selectDateRoute,arguments: movie);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  primary: Colors.blue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(AppPadding.p10),
                                  child: Text(
                                    AppStrings.getTickets,
                                    style: getBoldStyle(fontColor: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppPadding.p10),
                            border: Border.all(width: 1, color: Colors.blueAccent),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_arrow, color: Colors.white),
                                Text(
                                  AppStrings.watchTrailer,
                                  style: getBoldStyle(fontColor: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p60,left: AppPadding.p14),
                  child: Row(
                    children: [
                      InkWell(
                        radius: 30,
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios,size: AppSize.s18,color: Colors.white,)),
                      const SizedBox(width: AppSize.s20,),
                      Text(AppStrings.watch,style: getRegularStyle(fontSize: 20,fontColor: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.genre,
                    style: getBoldStyle(fontSize: 19),
                  ),
                  SizedBox(
                    height: 50,
                    child: GenreList(),
                  ),
                  const Divider(),
                  const SizedBox(height: AppSize.s8,),
                  Text(AppStrings.overView,style: getBoldStyle(),),
                  const SizedBox(height: AppSize.s8,),
                  Text(movie.overview,style: getRegularStyle(),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
class GenreList extends StatelessWidget {

  final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange];

   GenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        colors.length,
            (index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              AppStrings.genre,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}