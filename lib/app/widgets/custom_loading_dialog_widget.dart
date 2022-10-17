import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';
import 'custom_divider_widget.dart';
import 'custom_text_widget.dart';

class CustomLoadingDialog {
  static void customLoadingDialog(BuildContext context) {
    Get.dialog(
      Center(
        child: Wrap(
          children: [
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: CustomColors.primaryColor,
                  ),
                  CustomDivider(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  DefaultTextStyle(
                    style: CustomFonts.montserratBold12,
                    child: CustomText(
                      "Loading...",
                      style: CustomFonts.montserratBold12,
                    ),
                  ),
                ],
              ).margin(all: MediaQuery.of(context).size.height * .05),
            ).backgroundColor(color: Colors.white).borderRadius(all: 14),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}
