import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_db/domain/models/models.dart';
import 'package:movie_db/presentation/view_models/select_date_view_model.dart';
import 'package:movie_db/resources/color_manager/color_manager.dart';
import 'package:movie_db/resources/font_manager/font_manager.dart';
import 'package:movie_db/resources/route_manager/route_manager.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../resources/asset_manager/asset_manger.dart';
import '../common_widgets/common_widgets.dart';

class SelectDateScreen extends StatelessWidget {
  final Movie movie;
  const SelectDateScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateViewModel = Provider.of<SelectDateViewModel>(context);
    return Scaffold(
      appBar: getAppBar(context,movie),
      body: Padding(
        padding: const EdgeInsets.only(left: AppPadding.p20,right:AppPadding.p20,bottom: AppPadding.p8,top: AppPadding.p65),
        child: getBody(dateViewModel, context),
      ),
    );
  }


  Widget getBody(SelectDateViewModel dateViewModel, BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.s20),
          Text(
            AppStrings.date,
            style: getBoldStyle(),
          ),
          const SizedBox(height: AppSize.s8),
          SizedBox(
            height: AppSize.s50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateViewModel.dates.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    dateViewModel.dateSelectedIndex(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                    decoration: BoxDecoration(
                      color: dateViewModel.selectedIndex == index
                          ? ColorManager.lightBlue
                          : ColorManager.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      dateViewModel.dates[index],
                      style:  TextStyle(
                        color:dateViewModel.selectedIndex == index
                            ? Colors.white:Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSize.s20),

          SizedBox(
            height: AppPadding.p220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateViewModel.seatModelList.length,
              itemBuilder: (context, index) {
                var movieData = dateViewModel.seatModelList[index];
                print(movieData.theatre);
                return GestureDetector(
                  onTap: () {
                    dateViewModel.seatSelectedIndex(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(movieData.time,style: getBoldStyle(),),
                            const SizedBox(width: AppSize.s12,),
                            Text(movieData.theatre,style: getLightStyle(fontColor: ColorManager.greyColor),),
                          ],
                        ), // Replace with your seat label
                        const SizedBox(height: AppPadding.p8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: dateViewModel.selectedSeatIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:AppPadding.p20,horizontal: AppPadding.p40),
                            child: SvgPicture.asset(AssetManager.seatImage),
                          ),
                        ),
                        const SizedBox(height: AppSize.s12,),
                        RichText(
                          text:  TextSpan(
                            children: [
                              TextSpan(
                                text: AppStrings.from,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.greyColor,
                                ),
                              ),
                               TextSpan(
                                text: '\$${movieData.fromprice}',
                                style: const TextStyle(
                                  fontSize: FontSize.s16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: AppStrings.or,
                                style: TextStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.greyColor,
                                ),
                              ),
                               TextSpan(
                                text: '\$${movieData.bonusprice}bonus ',
                                style: const TextStyle(
                                  fontSize: FontSize.s16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.selectSeatRoute,arguments: movie);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(ColorManager.lightBlue), // Change the color to your desired color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                child:  Text(AppStrings.selectSeat,style: getRegularStyle(fontColor: Colors.white),),
              )),

        ],
      );
  }


}


