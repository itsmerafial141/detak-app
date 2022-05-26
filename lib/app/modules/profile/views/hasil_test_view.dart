// ignore_for_file: must_be_immutable

import 'package:detakapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:detakapp/app/modules/profile/views/hasil_test_detail.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasilTestView extends GetView<ProfileController> {
  var controllers = Get.put(ProfileController());
  var totalTest = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Hasil Test",
            style: CustomFonts.montserratBold18.copyWith(
              color: CustomColors.subTittle,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: CustomColors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: percentageOfScreenWidth(100),
          height: percentageOfScreenHeight(100) -
              55 -
              Get.mediaQuery.viewPadding.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "85",
                    style: CustomFonts.montserratBold40.copyWith(
                      fontSize: 96,
                      color: CustomColors.subTittle,
                    ),
                  ),
                  SizedBox(
                    width: percentageOfScreenWidth(2),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: CustomColors.red,
                        size: 40,
                      ),
                      Text(
                        "bpm",
                        style: CustomFonts.montserratBold18.copyWith(
                          color: CustomColors.subTittle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: percentageOfScreenHeight(50),
                    width: percentageOfScreenWidth(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "130",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                        Text(
                          "97",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                        Text(
                          "65",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                        Text(
                          "32",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: percentageOfScreenWidth(5),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: ColoredBox(
                              color: CustomColors.primaryColor,
                              child: SizedBox(
                                height: percentageOfScreenHeight(48),
                                width: percentageOfScreenWidth(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 5 + 9,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(Get.width),
                                child: ColoredBox(
                                  color: CustomColors.subTittle,
                                  child: SizedBox(
                                    height: 6,
                                    width: percentageOfScreenWidth(11),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image(
                                width: 9,
                                height: 12,
                                image: AssetImage("assets/icons/Polygon 1.png"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: controllers.countTestMetter(
                                  Get.arguments["totalTest"],
                                ) -
                                6,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: percentageOfScreenWidth(5),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(50),
                    width: percentageOfScreenWidth(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fast",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                        Text(
                          "Normal",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                        Text(
                          "Slow",
                          style: CustomFonts.montserratBold24.copyWith(
                            color: CustomColors.subTittle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenWidth(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(HasilTestDetailView());
                  },
                  child: Text(
                    "DETAIL RIWAYAT",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
