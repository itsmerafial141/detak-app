// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/values/strings.dart';
import '../controllers/home_controller.dart';

class DetailBeritaView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomColors.white,
          ),
        ),
        title: Text(
          "MemoApp",
          style: CustomFonts.montserratBold18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: percentageOfScreenWidth(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: percentageOfScreenWidth(5),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Kesehatan",
                        style: CustomFonts.montserratSemibold12.copyWith(
                          color: CustomColors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 5,
                        color: CustomColors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "9.22 AM",
                        style: CustomFonts.montserratSemibold12.copyWith(
                          color: CustomColors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(1),
                  ),
                  Text(
                    "Kenali, 8 Gejala Kanker Payudara Pada Wanita, Salah Satunya Nyeri",
                    style: CustomFonts.montserratBold14.copyWith(
                      color: CustomColors.subTittle,
                    ),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(1),
                  ),
                  Text(
                    "oleh Ryan Hernandez",
                    style: CustomFonts.montserratBold9.copyWith(
                      color: CustomColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: percentageOfScreenHeight(1),
            ),
            Image(
              width: double.infinity,
              height: percentageOfScreenHeight(30),
              fit: BoxFit.cover,
              image: const AssetImage(
                "assets/images/annie-spratt-zA7I5BtFbvw-unsplash.jpg",
              ),
            ),
            SizedBox(
              height: percentageOfScreenHeight(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: percentageOfScreenWidth(5),
              ),
              child: Text(
                CustomStrings.textBerita,
                style: CustomFonts.montserratRegular11.copyWith(
                  color: CustomColors.grey,
                ),
              ),
            ),
            SizedBox(
              height: percentageOfScreenHeight(5),
            ),
          ],
        ),
      ),
    );
  }
}
