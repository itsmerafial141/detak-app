import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/fonts.dart';
import '../../core/utils/helpers.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.leadingOnPressed,
    required this.title,
  }) : super(key: key);

  final Function() leadingOnPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: percentageOfScreenWidth(70),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: CustomFonts.montserratBold18.copyWith(
              color: CustomColors.primaryColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            splashRadius: 20,
            onPressed: leadingOnPressed,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: CustomColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
