// ignore_for_file: file_names

import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

class ScreenFive extends StatelessWidget {
  const ScreenFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("3. Login",
            textAlign: TextAlign.start, style: CustomFonts.montserratBold16),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        Text(
          "Pendaftaran pun selesai. Kamu sudah bisa login ke dalam aplikasi untuk menggunakan seluruh fiturnya.",
          textAlign: TextAlign.start,
          style: CustomFonts.montserratBold14
              .copyWith(color: CustomColors.darkGray),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .5,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              border: Border.all(
                width: 1,
                color: CustomColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Image.asset(
              "assets/obboarding/langkah1_3.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ).margin(horizontal: MediaQuery.of(context).size.width * .05);
  }
}
