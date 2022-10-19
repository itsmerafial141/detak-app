// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/modules/daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import 'package:detakapp/app/modules/kusioner/controllers/kusioner_controller.dart';
import 'package:detakapp/app/routes/app_pages.dart';
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
    var daftarRiwayatController = Get.put(DaftarRiwayatController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 55),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "DetakApp",
              style: CustomFonts.montserratBold18.copyWith(
                color: controller.answerModel.data.totalScore < 11
                    ? CustomColors.subTittle
                    : CustomColors.primaryColor,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                55 -
                MediaQuery.of(context).viewPadding.top,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    controller.answerModel.data.totalScore < 11
                        ? "assets/images/lowRisk.svg"
                        : "assets/images/highRisk.svg",
                    height: MediaQuery.of(context).size.height * .5,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            controller.answerModel.data.totalScore < 11
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
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .8,
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
                          width: MediaQuery.of(context).size.width * .8,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.back();
                                    daftarRiwayatController
                                        .loadingDataRefresh();
                                    daftarRiwayatController.initializeData();
                                  },
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .06,
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
                                width: MediaQuery.of(context).size.width * .05,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      AppPages.HT,
                                      arguments: {
                                        "id": controller
                                            .answerModel.data.idSadari,
                                        "from": "test",
                                      },
                                    );
                                    // Get.back();
                                    // Get.back();
                                    // Get.back();
                                    // navController.indexPageController = 2;
                                    // navController.update();
                                  },
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .06,
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
                                        color: controller.answerModel.data
                                                    .totalScore <
                                                11
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
      ),
    );
  }
}
