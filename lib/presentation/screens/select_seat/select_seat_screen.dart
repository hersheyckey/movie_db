import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_db/domain/models/models.dart';
import 'package:movie_db/presentation/view_models/select_seat_view_model.dart';
import 'package:movie_db/resources/color_manager/color_manager.dart';
import 'package:movie_db/resources/font_manager/font_manager.dart';
import 'package:movie_db/resources/string_manager/app_string_manager.dart';
import 'package:movie_db/resources/style_manager/style_manager.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';
import 'package:provider/provider.dart';
import '../../../resources/asset_manager/asset_manger.dart';
import '../common_widgets/common_widgets.dart';

class SelectSeatScreen extends StatelessWidget {
  final Movie movie;
  const SelectSeatScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context, movie),
        body: Consumer<SelectSeatViewModel>(
          builder: (context, selectSeatViewModel, _) {
            return Column(
              children: [
                getSeatView(context, selectSeatViewModel),
                const Spacer(),
                const BottomFixedSection()
              ],
            );
          },
        ));
  }

  //seat view
  Widget getSeatView(
      BuildContext context, SelectSeatViewModel selectSeatViewModel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AppSize.s300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onScaleUpdate: (details) {
                double newScale = selectSeatViewModel.scale * details.scale;
                if (newScale > 0.5 && newScale < 2.0) {
                  selectSeatViewModel.setScale(newScale);
                }
              },
              child: Transform.scale(
                scale: selectSeatViewModel.scale,
                child: Row(
                  children: [
                    SizedBox(
                      width: AppSize.s20,
                      height: AppSize.s200,
                      child: Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p40),
                        child: ListView(
                          children: List.generate(10, (index) {
                            int number = index + 1;
                            return Text(
                              "$number",
                              style: getRegularStyle(fontSize: 11),
                            );
                          }),
                        ),
                      ),
                    ),
                    SvgPicture.asset(AssetManager.selectSeatIcon),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppPadding.p20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getZoomButton(
                  selectSeatViewModel: selectSeatViewModel,
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    double newScale = selectSeatViewModel.scale + 0.1;
                    if (newScale < 2.0) {
                      selectSeatViewModel.setScale(newScale);
                    }
                  },
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                getZoomButton(
                  selectSeatViewModel: selectSeatViewModel,
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    double newScale = selectSeatViewModel.scale - 0.1;
                    if (newScale > 0.5) {
                      selectSeatViewModel.setScale(newScale);
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getZoomButton(
      {required selectSeatViewModel, required icon, required onPressed}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(icon: icon, onPressed: onPressed),
    );
  }
}

class BottomFixedSection extends StatelessWidget {
  const BottomFixedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSeatRow(
                      imagePath: AssetManager.selectedSeatIcon,
                      text: AppStrings.selectSeat),
                  const SizedBox(
                    width: AppPadding.p28,
                  ),
                  getSeatRow(
                      imagePath: AssetManager.vipSeat, text: "VIP (150\$)"),
                ],
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSeatRow(
                      imagePath: AssetManager.notAvailableSeat,
                      text: AppStrings.notAvailable),
                  const SizedBox(
                    width: AppPadding.p28,
                  ),
                  getSeatRow(
                      imagePath: AssetManager.regularSeat, text: "Regular"),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s28,
          ),
          Container(
            width: AppSize.s150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.lightGrey),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s20, vertical: AppSize.s8),
              child: Row(
                children: [
                  Text(
                    '4/',
                    style: getRegularStyle(fontSize: FontSize.s20),
                  ),
                  Text(
                    '3 row',
                    style: getRegularStyle(fontSize: FontSize.s14),
                  ),
                  const Spacer(),
                  const Icon(Icons.close)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.lightGrey),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s20, vertical: AppSize.s8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.totalPrice,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$100.00',
                        style: TextStyle(
                          fontSize: AppSize.s18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.lightBlue, // Background color
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),

                    // Padding
                  ),
                  child: Text(
                    AppStrings.proceedToPay,
                    style: getRegularStyle(fontColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row getSeatRow({required imagePath, required text}) {
    return Row(
      children: [
        SvgPicture.asset(imagePath),
        const SizedBox(
          width: AppSize.s8,
        ),
        Text(
          text,
          style: getRegularStyle(fontColor: ColorManager.greyColor),
        )
      ],
    );
  }
}
