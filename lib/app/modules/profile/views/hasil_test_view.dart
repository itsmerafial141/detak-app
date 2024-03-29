import 'package:detakapp/app/modules/daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import 'package:detakapp/app/modules/profile/controllers/hasil_test_controller.dart';
import 'package:detakapp/app/widgets/custom_app_bar_widget.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/skelaton_widget.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text_widget.dart';

class HasilTestView extends GetView<HasilTestController> {
  const HasilTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HasilTestController());
    var daftarRiwayatController = Get.put(DaftarRiwayatController());
    return Scaffold(
      appBar: CustomAppBar(
        label: "Detail Hasil Test",
        textColor: CustomColors.subTittle,
        colorBackground: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomColors.subTittle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.obx(
                (_) => Center(
                      child: RichText(
                        text: TextSpan(
                          style: CustomFonts.montserratRegular64.copyWith(
                            color: controller.listDataHasilTest.data
                                        .dataSadari[0].totalScore.toInt <
                                    11
                                ? CustomColors.green
                                : CustomColors.red,
                          ),
                          children: [
                            TextSpan(
                              text: controller.listDataHasilTest.data
                                  .dataSadari[0].totalScore,
                            ),
                            TextSpan(
                              text: " pt",
                              style: CustomFonts.montserratBold14.copyWith(
                                color: controller.listDataHasilTest.data
                                            .dataSadari[0].totalScore.toInt <
                                        11
                                    ? CustomColors.green
                                    : CustomColors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                onLoading: Skelaton(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.height * .1,
                ).shimmer()),
            CustomDivider(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                controller.obx(
                  (_) => Icon(
                    Icons.circle,
                    color: controller.listDataHasilTest.data.dataSadari[0]
                                .totalScore.toInt >=
                            11
                        ? CustomColors.red
                        : CustomColors.green,
                    size: MediaQuery.of(context).size.height * .05,
                  ),
                  onLoading: Skelaton(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.height * .05,
                  ).shimmer(),
                ),
                CustomDivider(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                controller.obx(
                  (_) => CustomText(
                    controller.listDataHasilTest.data.dataSadari[0].hasilSadari,
                    style: CustomFonts.montserratBold20,
                  ),
                  onLoading: Skelaton(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.height * .3,
                  ).shimmer(),
                ),
              ],
            ),
            CustomDivider(
              height: MediaQuery.of(context).size.height * .02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
              child: controller.obx(
                (_) => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .035,
                    )
                        .backgroundColor(
                          color: controller.listDataHasilTest.data.dataSadari[0]
                                      .totalScore.toInt <
                                  11
                              ? index < controller.scorIndicator
                                  ? CustomColors.green
                                  : CustomColors.grey.withOpacity(0.5)
                              : index < controller.scorIndicator
                                  ? CustomColors.red
                                  : CustomColors.grey.withOpacity(0.5),
                        )
                        .borderRadius(all: 5);
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .015,
                    );
                  },
                  itemCount: 12,
                ),
                onLoading: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Skelaton(
                      width: MediaQuery.of(context).size.width * .035,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    );
                  },
                  itemCount: 16,
                ).shimmer(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle,
                  size: 20,
                  color: CustomColors.green,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Text(
                  "<16 Low Risk",
                  style: CustomFonts.montserratRegular14,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                Icon(
                  Icons.circle,
                  size: 20,
                  color: CustomColors.red,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Text(
                  ">16 High Risk",
                  style: CustomFonts.montserratRegular14,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            controller.obx(
              (_) => CustomText(
                controller.listDataHasilTest.data.dataSadari[0].keterangan,
                style: CustomFonts.montserratBold14,
              ).margin(horizontal: MediaQuery.of(context).size.width * .1),
              onLoading: Column(
                children: [
                  Skelaton(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .01),
                  Skelaton(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .01),
                  Skelaton(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .01),
                ],
              )
                  .margin(horizontal: MediaQuery.of(context).size.height * .03)
                  .shimmer(),
            ),
            CustomDivider(
              height: MediaQuery.of(context).size.height * .02,
            ),
            controller.obx(
              (_) => ListView.separated(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .02),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return CustomDetailHasilTestCardWidget(
                    question: controller.listDataHasilTest.data
                        .dataSadariDetail[index].contentQuestion,
                    answer: controller
                        .listDataHasilTest.data.dataSadariDetail[index].answer,
                  )
                      .backgroundColor(
                        color: controller.listDataHasilTest.data.dataSadari[0]
                                    .totalScore.toInt <
                                11
                            ? CustomColors.boxDettailHasilTextLow
                            : CustomColors.boxDettailHasilTextHight,
                      )
                      .margin(
                          horizontal: MediaQuery.of(context).size.width * .05);
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: MediaQuery.of(context).size.height * .02,
                  );
                },
                itemCount:
                    controller.listDataHasilTest.data.dataSadariDetail.length,
              ),
              onLoading: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * .03),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) {
                  return Skelaton(
                    height: MediaQuery.of(context).size.height * .1,
                    width: double.infinity,
                  );
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: MediaQuery.of(context).size.height * .02,
                  );
                },
                itemCount: 7,
              ).shimmer(),
            ),
            controller.obx(
              (_) => ElevatedButton(
                onPressed: () {
                  if (controller.from.toString() == "list") {
                    Get.back();
                  } else {
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                  }
                  daftarRiwayatController.initializeData();
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.all(
                    CustomColors.black.withOpacity(0.1),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    controller.listDataHasilTest.data.dataSadari[0].totalScore
                                .toInt <
                            11
                        ? CustomColors.green
                        : CustomColors.red,
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: CustomText(
                  "BACK TO HOME",
                  style: CustomFonts.montserratBold14,
                  color: Colors.white,
                ),
              ).margin(horizontal: MediaQuery.of(context).size.width * .1),
              onLoading: Skelaton(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .7,
              ).shimmer(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDetailHasilTestCardWidget extends GetView<HasilTestController> {
  const CustomDetailHasilTestCardWidget({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: CustomFonts.montserratBold16.copyWith(
              color: controller.listDataHasilTest.data.dataSadari[0].totalScore
                          .toInt <
                      11
                  ? CustomColors.green
                  : CustomColors.red,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            answer,
            style: CustomFonts.montserratBold16.copyWith(
              color: controller.listDataHasilTest.data.dataSadari[0].totalScore
                          .toInt <
                      11
                  ? CustomColors.subTittle
                  : Colors.white,
            ),
          ),
        ],
      ).margin(all: MediaQuery.of(context).size.height * .02),
    );
  }
}
