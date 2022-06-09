import 'package:detakapp/app/modules/daftar_riwayat/views/daftar_riwayat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/values/strings.dart';
import '../../daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_view.dart';
import '../../test/controllers/test_controller.dart';
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
            TestView(),
            ProfileView(),
            DaftarRiwayatView(),
          ],
        );
      },
    );
  }

  Widget _customBottomNavigation() {
    // var homeController = Get.put(HomeController());
    // var testController = Get.put(TestController());
    // var profileController = Get.put(ProfileController());
    // var daftarRiwayatController = Get.put(DaftarRiwayatController());
    // List<Function> listInitilaizeData = [
    //   homeController.initializeData,
    //   testController.initializeData,
    //   profileController.initializeData,
    //   daftarRiwayatController.initializeData,
    // ];
    return GetBuilder<NavigasiController>(
      init: NavigasiController(),
      builder: (controller) {
        return SizedBox(
          height: 60,
          child: BottomNavigationBar(
            onTap: (index) {
              controller.changePageIndex(index);
              // if (index == 3) {
              //   daftarRiwayatController.initializeData();
              // }
            },
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
