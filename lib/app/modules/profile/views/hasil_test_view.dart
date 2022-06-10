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
                                    17
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
                                        17
                                    ? CustomColors.green
                                    : CustomColors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                onLoading: Skelaton(
                  height: 10.sh,
                  width: 10.sh,
                ).shimmer()),
            CustomDivider(
              height: 1.sh,
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
                            17
                        ? CustomColors.red
                        : CustomColors.green,
                    size: 5.sh,
                  ),
                  onLoading: Skelaton(
                    height: 5.sh,
                    width: 5.sh,
                  ).shimmer(),
                ),
                CustomDivider(
                  width: 1.sh,
                ),
                controller.obx(
                  (_) => CustomText(
                    controller.listDataHasilTest.data.dataSadari[0].hasilSadari,
                    style: CustomFonts.montserratBold20,
                  ),
                  onLoading: Skelaton(
                    height: 5.sh,
                    width: 30.sh,
                  ).shimmer(),
                ),
              ],
            ),
            CustomDivider(
              height: 2.sh,
            ),
            SizedBox(
              height: 8.sh,
              child: controller.obx(
                (_) => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: 3.5.sw,
                    )
                        .backgroundColor(
                          color: controller.listDataHasilTest.data.dataSadari[0]
                                      .totalScore.toInt <
                                  17
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
                      width: 1.sw,
                    );
                  },
                  itemCount: 16,
                ),
                onLoading: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Skelaton(
                      width: 3.5.sw,
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      width: 1.sw,
                    );
                  },
                  itemCount: 16,
                ).shimmer(),
              ),
            ),
            SizedBox(
              height: 2.sh,
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
                  width: 2.sw,
                ),
                Text(
                  "<16 Low Risk",
                  style: CustomFonts.montserratRegular14,
                ),
                SizedBox(
                  width: 5.sw,
                ),
                Icon(
                  Icons.circle,
                  size: 20,
                  color: CustomColors.red,
                ),
                SizedBox(
                  width: 2.sw,
                ),
                Text(
                  ">16 Low Risk",
                  style: CustomFonts.montserratRegular14,
                ),
              ],
            ),
            SizedBox(
              height: 2.sh,
            ),
            controller.obx(
              (_) => CustomText(
                controller.listDataHasilTest.data.dataSadari[0].keterangan,
                style: CustomFonts.montserratBold14,
              ).margin(horizontal: 10.sw),
              onLoading: Column(
                children: [
                  Skelaton(
                    width: double.infinity,
                    height: 2.sh,
                  ),
                  CustomDivider(height: 1.sh),
                  Skelaton(
                    width: double.infinity,
                    height: 2.sh,
                  ),
                  CustomDivider(height: 1.sh),
                  Skelaton(
                    width: 50.sw,
                    height: 2.sh,
                  ),
                  CustomDivider(height: 1.sh),
                ],
              ).margin(horizontal: 3.sh).shimmer(),
            ),
            CustomDivider(
              height: 2.sh,
            ),
            controller.obx(
              (_) => ListView.separated(
                padding: EdgeInsets.only(bottom: 2.sh),
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
                                17
                            ? CustomColors.boxDettailHasilTextLow
                            : CustomColors.boxDettailHasilTextHight,
                      )
                      .margin(horizontal: 5.sw);
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: 2.sh,
                  );
                },
                itemCount:
                    controller.listDataHasilTest.data.dataSadariDetail.length,
              ),
              onLoading: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 3.sh),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) {
                  return Skelaton(
                    height: 10.sh,
                    width: double.infinity,
                  );
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: 2.sh,
                  );
                },
                itemCount: 7,
              ).shimmer(),
            ),
            controller.obx(
              (_) => ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.all(
                    CustomColors.black.withOpacity(0.1),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    controller.listDataHasilTest.data.dataSadari[0].totalScore
                                .toInt <
                            17
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
              ).margin(horizontal: 10.sw),
              onLoading: Skelaton(
                height: 10.sh,
                width: 70.sw,
              ).shimmer(),
            ),
            SizedBox(
              height: 4.sh,
            ),

            ///
            // controller.obx(
            //   (_) {
            //     return Stack(
            //       alignment: Alignment.bottomLeft,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             SizedBox(
            //               height: 8.sh,
            //               width: 40.sw,
            //             )
            //                 .backgroundColor(color: CustomColors.green)
            //                 .borderRadius(horizontalLeft: 7),
            //             SizedBox(
            //               height: 8.sh,
            //               width: 40.sw,
            //             )
            //                 .backgroundColor(color: CustomColors.red)
            //                 .borderRadius(horizontalRight: 7),
            //           ],
            //         ).margin(bottom: 0.5.sh),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Image(
            //               height: 2.sh,
            //               width: 2.sh,
            //               fit: BoxFit.fitWidth,
            //               image: const AssetImage("assets/icons/polygon.png"),
            //             ),
            //             SizedBox(
            //               height: 9.sh,
            //               width: 1.sh,
            //             )
            //                 .backgroundColor(color: CustomColors.subTittle)
            //                 .borderRadius(all: 1),
            //           ],
            //         ).margin(
            //           left: controller
            //               .countTestMetter(
            //                 controller.listDataHasilTest.data.dataSadari[0]
            //                     .totalScore.toInt,
            //               )
            //               .sh,
            //         ),
            //       ],
            //     );
            //   },
            //   onLoading: Center(
            //     child: Skelaton(
            //       width: 80.sw,
            //       height: 8.sh,
            //     ).shimmer(),
            //   ),
            // ),
            // CustomDivider(
            //   height: 1.sh,
            // ),
            // controller.obx(
            //   (_) {
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       mainAxisSize: MainAxisSize.max,
            //       children: [
            //         Column(
            //           children: [
            //             CustomText(
            //               "<16",
            //               style: CustomFonts.montserratRegular24,
            //             ),
            //             CustomText(
            //               "Low Risk",
            //               style: CustomFonts.montserratRegular11,
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             CustomText(
            //               "<17",
            //               style: CustomFonts.montserratRegular24,
            //             ),
            //             CustomText(
            //               "High Risk",
            //               style: CustomFonts.montserratRegular11,
            //             ),
            //           ],
            //         ),
            //       ],
            //     ).margin(horizontal: 10.sw);
            //   },
            //   onLoading: Row(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         children: [
            //           Skelaton(
            //             height: 8.sh,
            //             width: 8.sh,
            //           ),
            //           CustomDivider(height: 1.sh),
            //           Skelaton(
            //             height: 2.sh,
            //             width: 10.sh,
            //           ),
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           Skelaton(
            //             height: 8.sh,
            //             width: 8.sh,
            //           ),
            //           CustomDivider(height: 1.sh),
            //           Skelaton(
            //             height: 2.sh,
            //             width: 10.sh,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ).shimmer().margin(horizontal: 10.sw),
            // ),
            // CustomDivider(
            //   height: 5.sh,
            // ),
            // controller.obx(
            //   (_) => ListView.separated(
            //     padding: EdgeInsets.only(bottom: 2.sh),
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (_, index) {
            //       return Stack(
            //         alignment: Alignment.centerLeft,
            //         children: [
            //           Row(
            //             children: [
            //               Expanded(
            //                 flex: 9,
            //                 child: SizedBox(
            //                   height: 7.sh,
            //                   child: Align(
            //                     alignment: Alignment.centerLeft,
            //                     child: Text(
            //                       controller.listDataHasilTest.data
            //                           .dataSadariDetail[index].contentQuestion,
            //                       style: CustomFonts.montserratBold9,
            //                     ).margin(left: 2.sh),
            //                   ),
            //                 )
            //                     .backgroundColor(color: CustomColors.whiteGrey)
            //                     .borderRadius(all: 2),
            //               ),
            //               CustomDivider(
            //                 width: 2.sw,
            //               ),
            //               Expanded(
            //                 flex: 2,
            //                 child: SizedBox(
            //                   height: 7.sh,
            //                   // width: 7.sh,
            //                   child: Align(
            //                     alignment: Alignment.center,
            //                     child: AutoSizeText(
            //                       controller.listDataHasilTest.data
            //                           .dataSadariDetail[index].answer,
            //                       maxLines: 1,
            //                       style: CustomFonts.montserratBold16,
            //                     ).margin(all: 1.sh),
            //                   ),
            //                 )
            //                     .backgroundColor(color: CustomColors.whiteGrey)
            //                     .borderRadius(all: 2),
            //               ),
            //             ],
            //           ).margin(left: 0.5.sh),
            //           SizedBox(
            //             height: 3.sh,
            //             width: 1.sh,
            //           ).backgroundColor(color: Colors.red).borderRadius(all: 1),
            //         ],
            //       ).margin(horizontal: 2.sh);
            //     },
            //     separatorBuilder: (_, __) {
            //       return CustomDivider(
            //         height: 2.sh,
            //       );
            //     },
            //     itemCount:
            //         controller.listDataHasilTest.data.dataSadariDetail.length,
            //   ),
            //   onLoading: ListView.separated(
            //     padding: EdgeInsets.symmetric(horizontal: 3.sh),
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (_, __) {
            //       return Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Expanded(
            //             flex: 7,
            //             child: Skelaton(
            //               height: 7.sh,
            //             ),
            //           ),
            //           CustomDivider(
            //             width: 2.sw,
            //           ),
            //           Expanded(
            //             flex: 1,
            //             child: Skelaton(
            //               height: 7.sh,
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //     separatorBuilder: (_, __) {
            //       return CustomDivider(
            //         height: 2.sh,
            //       );
            //     },
            //     itemCount: 7,
            //   ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   width: 100.sw,
      //   height: 8.sh,
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     style: ButtonStyle(
      //       elevation: MaterialStateProperty.all(0),
      //       overlayColor: MaterialStateProperty.all(
      //         CustomColors.black.withOpacity(0.1),
      //       ),
      //       backgroundColor:
      //           MaterialStateProperty.all(CustomColors.primaryColor),
      //       padding: MaterialStateProperty.all(EdgeInsets.zero),
      //       shape: MaterialStateProperty.all(
      //         RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //       ),
      //     ),
      //     child: CustomText(
      //       "DAFTAR RIWAYAT",
      //       style: CustomFonts.montserratBold14,
      //       color: Colors.white,
      //     ),
      //   ),
      // ).paddingAll(2.sh),
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
                      17
                  ? CustomColors.green
                  : CustomColors.red,
            ),
          ),
          SizedBox(
            height: 0.5.sh,
          ),
          Text(
            answer,
            style: CustomFonts.montserratBold16.copyWith(
              color: controller.listDataHasilTest.data.dataSadari[0].totalScore
                          .toInt <
                      17
                  ? CustomColors.subTittle
                  : Colors.white,
            ),
          ),
        ],
      ).margin(all: 2.sh),
    );
  }
}
