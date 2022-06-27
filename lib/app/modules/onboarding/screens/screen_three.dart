import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("1. Pilih tombol “Pendaftaran Pengguna Mobile",
            textAlign: TextAlign.start, style: CustomFonts.montserratBold16),
        SizedBox(height: 1.sh),
        Text(
          "Jika aplikasi sudah terinstal, buka dan pilihlah tombol “Pendaftaran Pengguna Mobile”.",
          textAlign: TextAlign.start,
          style: CustomFonts.montserratBold14
              .copyWith(color: CustomColors.darkGray),
        ),
        SizedBox(height: 5.sh),
        Center(
          child: Container(
            height: 50.sh,
            width: 50.sw,
            padding: EdgeInsets.only(top: 2.sh),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              border: Border.all(
                width: 1,
                color: CustomColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Image.asset(
              "assets/obboarding/langkah1_1.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    ).margin(horizontal: 5.sw);
  }
}
