import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class CustomTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    iconColor: CustomColors.disable,
    filled: true,
    fillColor: CustomColors.white,
    labelStyle: CustomFonts.montserratRegular12.copyWith(
      color: CustomColors.red,
    ),
    hintStyle: CustomFonts.montserratRegular12.copyWith(
      color: CustomColors.disable,
    ),
    errorStyle: CustomFonts.montserratRegular10.copyWith(
      color: CustomColors.red,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.darkGray,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.disable,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        width: 1,
        color: CustomColors.red,
      ),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        CustomFonts.montserratBold14,
      ),
      backgroundColor: MaterialStateProperty.all(
        CustomColors.primaryColor,
      ),
      elevation: MaterialStateProperty.all(0),
      side: MaterialStateProperty.all(
        BorderSide.none,
      ),
      minimumSize: MaterialStateProperty.all(
        const Size(double.infinity, 40),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );
}
