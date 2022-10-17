// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';
import 'custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_key_in_widget_constructors
  const CustomAppBar({
    this.colorBackground,
    this.textColor,
    this.label,
    this.centerTitle,
    this.leadingColor,
    this.leading,
  });
  final Color? colorBackground;
  final Color? textColor;
  final Color? leadingColor;
  final String? label;
  final bool? centerTitle;
  final Widget? leading;

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 45),
      child: AppBar(
        backgroundColor: colorBackground ?? CustomColors.primaryColor,
        elevation: 0,
        centerTitle: centerTitle ?? true,
        title: CustomText(
          label ?? "DetakApp",
          style: CustomFonts.montserratBold18,
          color: textColor ?? Colors.white,
        ),
        leading: leading ?? const SizedBox(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}
