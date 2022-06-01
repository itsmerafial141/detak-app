// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    this.style,
    this.color,
  });

  final String? text;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style?.copyWith(
            color: color ?? CustomColors.subTittle,
          ) ??
          CustomFonts.montserratRegular12.copyWith(
            color: CustomColors.subTittle,
          ),
    );
  }
}
