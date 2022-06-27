import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

class ScreenNine extends StatelessWidget {
  const ScreenNine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("3.	Tes dan Hasil",
            textAlign: TextAlign.start, style: CustomFonts.montserratBold16),
        SizedBox(height: 1.sh),
        Text(
          "Fitur ini memungkinkan peserta untuk menilai resiko pasien ACS. Meliputi beberapa penilaian dengan memperhitungkan semua factor resiko dan memberikan skor untuk setiap item. Pengisian tes dibuat mudah dan sederhana untuk memudahkan pengguna dalam menghitung factor resiko. ",
          textAlign: TextAlign.start,
          style: CustomFonts.montserratBold14
              .copyWith(color: CustomColors.darkGray),
        ),
        SizedBox(height: 5.sh),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.sh,
                width: 40.sw,
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
                  "assets/obboarding/test1.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: 40.sh,
                width: 40.sw,
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
                  "assets/obboarding/test_dialog.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    ).margin(horizontal: 5.sw);
  }
}
