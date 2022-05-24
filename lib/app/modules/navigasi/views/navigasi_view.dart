import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/values/strings.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../test/views/test_view.dart';
import '../../video/views/video_view.dart';
import '../controllers/navigasi_controller.dart';

class NavigasiView extends GetView<NavigasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: GetBuilder<NavigasiController>(
          init: NavigasiController(),
          builder: (_) {
            return AppBar(
              backgroundColor: controller.indexPageController > 0
                  ? CustomColors.primaryColor
                  : CustomColors.secondaryColor,
              elevation: 0,
              centerTitle: true,
              title: GetBuilder<NavigasiController>(
                init: NavigasiController(),
                builder: (_) {
                  return Text(
                    controller.indexPageController == 3 ? "" : "DetakAppw",
                    style: CustomFonts.montserratBold18,
                  );
                },
              ),
              leading: GetBuilder<NavigasiController>(
                init: NavigasiController(),
                builder: (_) {
                  return controller.indexPageController == 3
                      ? IconButton(
                          onPressed: () {
                            controller
                                .changePageIndex(controller.previousIndex);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        )
                      : SizedBox();
                },
              ),
            );
          },
        ),
      ),
      body: GetBuilder<NavigasiController>(
        init: NavigasiController(),
        builder: (_) {
          return IndexedStack(
            index: controller.indexPageController,
            children: [
              HomeView(),
              VideoView(),
              TestView(),
              ProfileView(),
            ],
          );
        },
      ),
      bottomNavigationBar: GetBuilder<NavigasiController>(
        init: NavigasiController(),
        builder: (_) {
          return BottomNavigationBar(
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
                  icon: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Image(
                        color: controller.indexPageController == index
                            ? CustomColors.primaryColor
                            : CustomColors.disable,
                        image: AssetImage(
                          CustomStrings.listBottomNavigation[index][0],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: CustomStrings.listBottomNavigation[index][1],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
