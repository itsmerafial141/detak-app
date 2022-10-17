import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSix extends StatelessWidget {
  const ScreenSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Apa saja fitur-fitur Mobile DETAK?",
            textAlign: TextAlign.center, style: CustomFonts.montserratBold14),
        Text(
            "Fitur yang dimiliki Mobile DETAK ini cukup lengkap, mulai dari pencegahan, menilai resiko, tata laksana atau management pasien ACS dan edukasi mengenai ACS. Berikut ini daftar lengkapnya: ",
            textAlign: TextAlign.center,
            style: CustomFonts.montserratBold14),
      ],
    ).margin(horizontal: MediaQuery.of(context).size.width * .05);
  }
}
