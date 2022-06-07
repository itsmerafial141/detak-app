// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key? key,
    this.style,
    this.color,
    this.textAlign,
  }) : super(key: key);

  final String? text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.center,
      style: style?.copyWith(
            color: color ?? CustomColors.subTittle,
          ) ??
          CustomFonts.montserratRegular12.copyWith(
            color: CustomColors.subTittle,
          ),
    );
  }
}
