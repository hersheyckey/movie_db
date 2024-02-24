import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_db/resources/values_manager/values_manager.dart';

import '../../../../resources/asset_manager/asset_manger.dart';
import '../../../../resources/color_manager/color_manager.dart';
import '../../../view_models/main_screen_view_model.dart';

class RoundedBottomNavBar extends StatelessWidget {
  final MainScreenViewModel viewModel;

  const RoundedBottomNavBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      child: Container(
        height: AppSize.s65,
        color: ColorManager.primaryColor, // Change the color as needed
        child: BottomNavigationBar(
          currentIndex: viewModel.selectedIndex,
          onTap: (index) {
            viewModel.updateSelectedIndex(index); // Update selected index
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetManager.dashBoardIcon),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetManager.watchIcon),
              label: "Watch",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetManager.mediaLibraryIcon),
              label: "Media Library",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetManager.moreIcon),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}