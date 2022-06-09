import 'package:detakapp/app/modules/daftar_riwayat/views/daftar_riwayat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            TestView(),
            DaftarRiwayatView(),
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
            onTap: (index) {
              controller.changePageIndex(index);
            },
            currentIndex: controller.indexPageController,
            selectedItemColor: CustomColors.secondaryColor,
            unselectedItemColor: CustomColors.disable,
            selectedLabelStyle: CustomFonts.montserratMedium10,
            unselectedLabelStyle: CustomFonts.montserratMedium10,
            showUnselectedLabels: true,
            items: List.generate(
              CustomStrings.listSVGnavigationBar.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    CustomStrings.listSVGnavigationBar[index][0],
                    color: controller.indexPageController == index
                        ? CustomColors.primaryColor
                        : CustomColors.disable,
                  ),
                  label: CustomStrings.listSVGnavigationBar[index][1],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
