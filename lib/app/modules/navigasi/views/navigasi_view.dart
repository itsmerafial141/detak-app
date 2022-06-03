import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/values/strings.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../test/views/test_view.dart';
import '../controllers/navigasi_controller.dart';

class NavigasiView extends GetView<NavigasiController> {
  const NavigasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationController(),
      bottomNavigationBar: _customBottomNavigation(),
    );
  }

  Widget _navigationController() {
    return GetBuilder<NavigasiController>(
      init: NavigasiController(),
      builder: (controller) {
        return IndexedStack(
          index: controller.indexPageController,
          children: [
            HomeView(),
            // const VideoView(),
            const TestView(),
            ProfileView(),
          ],
        );
      },
    );
  }

  Widget _customBottomNavigation() {
    return GetBuilder<NavigasiController>(
      init: NavigasiController(),
      builder: (controller) {
        return SizedBox(
          height: 60,
          child: BottomNavigationBar(
            onTap: controller.changePageIndex,
            currentIndex: controller.indexPageController,
            selectedItemColor: CustomColors.secondaryColor,
            unselectedItemColor: CustomColors.disable,
            selectedLabelStyle: CustomFonts.montserratMedium10,
            unselectedLabelStyle: CustomFonts.montserratMedium10,
            showUnselectedLabels: true,
            items: List.generate(
              CustomStrings.listBottomNavigation.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: Image(
                    color: controller.indexPageController == index
                        ? CustomColors.primaryColor
                        : CustomColors.disable,
                    image: AssetImage(
                      CustomStrings.listBottomNavigation[index][0],
                    ),
                  ),
                  label: CustomStrings.listBottomNavigation[index][1],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
