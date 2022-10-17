import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/cupertino.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Apa itu mobile DETAK?",
            textAlign: TextAlign.center, style: CustomFonts.montserratBold14),
        Text(
            "Aplikasi Mobile DETAK merupakan aplikasi yang diluncurkan oleh untuk pasien dengan resiko ACS mengakses layanan DETAK, seperti menilai factor resiko, tata laksana ACS, pencegahan ACS dan edukasi mengenai penyakit ACS serta sebagainya langsung dari ponsel.",
            textAlign: TextAlign.center,
            style: CustomFonts.montserratBold14),
      ],
    ).margin(horizontal: MediaQuery.of(context).size.width * .05);
  }
}
