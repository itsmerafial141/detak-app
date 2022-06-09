// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/modules/daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import 'package:detakapp/app/modules/kusioner/controllers/kusioner_controller.dart';
import 'package:detakapp/app/modules/navigasi/controllers/navigasi_controller.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';

class HasilView extends GetView<KusionerController> {
  HasilView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(KusionerController());

  @override
  Widget build(BuildContext context) {
    var navController = Get.put(NavigasiController());
    var daftarRiwayatController = Get.put(DaftarRiwayatController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "DetakApp",
            style: CustomFonts.montserratBold18.copyWith(
              color: controller.answerModel.data.totalScore < 17
                  ? CustomColors.subTittle
                  : CustomColors.primaryColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.sw,
          height: 100.sh - 55,
          child: Stack(
            children: [
              SizedBox(
                width: 100.sw,
                child: SvgPicture.asset(
                  controller.answerModel.data.totalScore < 17
                      ? "assets/images/lowRisk.svg"
                      : "assets/images/highRisk.svg",
                  height: 50.sh,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50.sh,
                  width: 100.sw,
                  padding: EdgeInsets.all(10.sw),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          controller.answerModel.data.totalScore < 17
                              ? "assets/images/hasilBgLowRisk.png"
                              : "assets/images/hasilBgHighRisk.png"),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 64,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: controller.answerModel.data.totalScore
                                  .toString(),
                            ),
                            TextSpan(
                              text: " pt".toString(),
                              style: CustomFonts.montserratBold14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        controller.answerModel.data.hasilSadari,
                        textAlign: TextAlign.center,
                        style: CustomFonts.montserratBold24.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 2.sh,
                      ),
                      SizedBox(
                        height: 10.sh,
                        width: 80.sw,
                        child: AutoSizeText(
                          controller.answerModel.data.keterangan,
                          textAlign: TextAlign.center,
                          style: CustomFonts.montserratRegular14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 80.sw,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                  Get.back();
                                  daftarRiwayatController.initializeData();
                                },
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  height: 6.sh,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Text(
                                    "TEST ULANG",
                                    style:
                                        CustomFonts.montserratBold14.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.sw,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                  Get.back();
                                  Get.back();
                                  navController.indexPageController = 2;
                                  navController.update();
                                  daftarRiwayatController.initializeData();
                                },
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  height: 6.sh,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "LIHAT DETAIL",
                                    style:
                                        CustomFonts.montserratBold14.copyWith(
                                      color: controller
                                                  .answerModel.data.totalScore <
                                              17
                                          ? Colors.green
                                          : CustomColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
