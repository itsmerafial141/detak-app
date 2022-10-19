import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/color_swatch.dart';
import '../../core/theme/fonts.dart';
import '../../core/values/keys/response_code_key.dart';

class MyRawSnackBar {
  static SnackbarController rawSanckBar({
    required int statusCode,
    required String message,
  }) {
    return Get.rawSnackbar(
      messageText: Text(
        message,
        style: CustomFonts.montserratBold12.copyWith(color: Colors.white),
      ),
      borderRadius: 8,
      borderWidth: 1,
      snackPosition: SnackPosition.TOP,
      backgroundColor: statusCode == RespCode.success
          ? CustomSwatch.success
          : statusCode == RespCode.error
              ? CustomSwatch.danger
              : Colors.white,
      margin: const EdgeInsets.all(4),
    );
  }
}
