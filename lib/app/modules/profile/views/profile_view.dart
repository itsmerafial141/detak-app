// ignore_for_file: must_be_immutable

import 'package:detakapp/app/modules/navigasi/controllers/navigasi_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/values/strings.dart';
import '../../login/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<NavigasiController> {
  ProfileView({
    Key? key,
  }) : super(key: key);
  var authController = Get.put(AuthController());
  var navController = Get.put(NavigasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navController.changePageIndex(navController.previousIndex);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenWidth(10),
                  vertical: percentageOfScreenWidth(5)),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GetBuilder<ProfileController>(
                      init: ProfileController(),
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.getCapitalizeString(controller.name),
                              style: CustomFonts.montserratBold14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.phone,
                              style: CustomFonts.montserratSemibold12.copyWith(
                                color: CustomColors.subTittle.withOpacity(0.5),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return index > 0
                    ? Divider(
                        height: 20,
                        color: CustomColors.grey,
                      )
                    : const SizedBox(
                        height: 20,
                      );
              },
              separatorBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: percentageOfScreenWidth(5),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onTap: () {
                      switch (index) {
                        // case 0: //Hasil Test
                        //   Get.toNamed(AppPages.DR);
                        //   break;
                        case 0: //logout
                          Get.bottomSheet(
                            Wrap(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: percentageOfScreenHeight(5),
                                      ),
                                      SizedBox(
                                        width: percentageOfScreenWidth(75),
                                        child: Text(
                                          "Apakah anda yakin ingin keluar dari aplikasi?",
                                          textAlign: TextAlign.center,
                                          style: CustomFonts.montserratBold14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: percentageOfScreenHeight(5),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              percentageOfScreenWidth(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.white,
                                                  ),
                                                  side:
                                                      MaterialStateProperty.all(
                                                    BorderSide(
                                                      width: 1,
                                                      color: CustomColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Tidak",
                                                  style: CustomFonts
                                                      .montserratBold14
                                                      .copyWith(
                                                    color: CustomColors
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: percentageOfScreenWidth(2),
                                            ),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  authController.logout();
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  "Ya",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: percentageOfScreenHeight(5),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                          break;
                      }
                    },
                    leading: Image(
                      height: 20,
                      width: 20,
                      color: CustomColors.primaryColor,
                      image: AssetImage(
                        CustomStrings.listProfileListTile[index][0],
                      ),
                    ),
                    title: Text(
                      CustomStrings.listProfileListTile[index][1],
                      style: CustomFonts.montserratSemibold12
                          .copyWith(color: CustomColors.primaryColor),
                    ),
                  ),
                );
              },
              itemCount: CustomStrings.listProfileListTile.length + 1,
            ),
          ],
        ),
      ),
    );
  }
}
