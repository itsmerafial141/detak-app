import 'package:detakapp/app/modules/test/views/preparing_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: CustomColors.primaryColor,
      child: SizedBox(
        width: percentageOfScreenWidth(100),
        height: percentageOfScreenHeight(100),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              width: percentageOfScreenWidth(95),
              image: const AssetImage("assets/images/testBackground.png"),
              fit: BoxFit.fitWidth,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: percentageOfScreenHeight(5),
                      ),
                      Text(
                        "Yuk jawab beberapa pertanyaan berikut untuk menemukan gejala kanker payudara sedini mungkin!",
                        style: CustomFonts.montserratBold18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: percentageOfScreenHeight(2),
                      ),
                      RichText(
                        text: TextSpan(
                          style: CustomFonts.montserratMedium9.copyWith(
                            color: Colors.white,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  "Dengan melanjutkan berarti Anda telah setuju dengan ",
                            ),
                            TextSpan(
                              text: "Ketentuan Layanan ",
                              style: CustomFonts.montserratBold9.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Ketentuan Layanan ");
                                },
                            ),
                            const TextSpan(
                              text: "dan ",
                            ),
                            TextSpan(
                              text: "Kebijakan Privasi ",
                              style: CustomFonts.montserratBold9.copyWith(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Kebijakan Privasi ");
                                },
                            ),
                            const TextSpan(
                              text: "MamoApp",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: percentageOfScreenHeight(10),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(PreparingTestView());
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        child: Text(
                          "Lanjut",
                          style: CustomFonts.montserratBold16.copyWith(
                            color: CustomColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
