import 'package:detakapp/app/modules/kusioner/controllers/kusioner_controller.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';

class HasilView extends GetView<KusionerController> {
  const HasilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "DetakApp",
            style: CustomFonts.montserratBold18.copyWith(
              color: CustomColors.primaryColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: percentageOfScreenWidth(100),
          height: percentageOfScreenHeight(100) - 55,
          child: Stack(
            children: [
              SizedBox(
                width: percentageOfScreenWidth(100),
                child: Image(
                  height: percentageOfScreenHeight(50),
                  image: AssetImage(
                    controller.answerModel.data.totalScore < 17
                        ? "assets/images/sehat.png"
                        : "assets/images/sakit.png",
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: percentageOfScreenHeight(50),
                  width: percentageOfScreenWidth(100),
                  padding: EdgeInsets.all(percentageOfScreenWidth(10)),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/hasilBg.png"),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text(
                        controller.answerModel.data.hasilSadari,
                        textAlign: TextAlign.center,
                        style: CustomFonts.montserratBold18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: percentageOfScreenHeight(2),
                      ),
                      Text(
                        controller.answerModel.data.keterangan,
                        textAlign: TextAlign.center,
                        style: CustomFonts.montserratRegular12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        child: Text(
                          "LANJUT",
                          style: CustomFonts.montserratBold14.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
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
