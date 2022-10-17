import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Bagaimana cara daftar aplikasi Mobile DETAK?",
            textAlign: TextAlign.center, style: CustomFonts.montserratBold14),
        Text(
            "Hal pertama yang harus dilakukan adalah mengunduh dan menginstal aplikasi Mobile DETAK di smartphone-mu. Silakan kunjungi App Store bagi pengguna Play Store bagi pengguna Android untuk mengunduh aplikasi Mobile DETAK secara gratis.",
            textAlign: TextAlign.center,
            style: CustomFonts.montserratBold14),
      ],
    ).margin(horizontal: MediaQuery.of(context).size.width * .05);
  }
}
