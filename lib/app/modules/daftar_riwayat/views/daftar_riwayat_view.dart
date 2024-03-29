// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/modules/daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import 'package:detakapp/app/widgets/custom_app_bar_widget.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/skelaton_widget.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../routes/app_pages.dart';

class DaftarRiwayatView extends GetView<DaftarRiwayatController> {
  DaftarRiwayatView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(DaftarRiwayatController());

  @override
  Widget build(BuildContext context) {
    // var navController = Get.put(NavigasiController());
    return Scaffold(
      appBar: CustomAppBar(
        label: "Daftar Riwayat",
        textColor: CustomColors.subTittle,
        colorBackground: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     navController.changePageIndex(navController.previousIndex);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_rounded,
        //     color: CustomColors.subTittle,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 45 - 60,
          width: MediaQuery.of(context).size.width,
          child: controller.obx(
              (_) => ListView.separated(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .04,
                        bottom: MediaQuery.of(context).size.height * .04),
                    itemBuilder: (_, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: AutoSizeText(
                              controller
                                  .daftarRiwayatModel.data[index].totalScore,
                              textAlign: TextAlign.center,
                              style: CustomFonts.montserratRegular64,
                              maxLines: 1,
                            ),
                          ),
                          CustomDivider(
                            width: MediaQuery.of(context).size.height * .02,
                          ),
                          Expanded(
                            flex: 8,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: controller.daftarRiwayatModel
                                              .data[index].totalScore.toInt >=
                                          11
                                      ? CustomColors.red
                                      : CustomColors.green,
                                  size: 19,
                                ),
                                CustomDivider(
                                  width:
                                      MediaQuery.of(context).size.height * .01,
                                ),
                                AutoSizeText(
                                  controller.daftarRiwayatModel.data[index]
                                      .hasilSadari,
                                  maxLines: 1,
                                  style: CustomFonts.montserratBold20,
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AutoSizeText(
                                      controller
                                          .datePicker(
                                              value: controller
                                                  .daftarRiwayatModel
                                                  .data[index]
                                                  .dateSadari
                                                  .toString(),
                                              index: 0)
                                          .formatedDate("d MMMM yyyy"),
                                      maxLines: 1,
                                      style: CustomFonts.montserratBold11,
                                    ),
                                    AutoSizeText(
                                      controller.daftarRiwayatModel.data[index]
                                          .dateSadari
                                          .toString()
                                          .formatedDate("h:mm a"),
                                      maxLines: 1,
                                      style: CustomFonts.montserratBold11,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          .paddingSymmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * .02)
                          // .backgroundColor(color: CustomColors.whiteGrey)
                          .borderRadius(all: 10)
                          .button(
                            onPressed: () {
                              Get.toNamed(AppPages.HT, arguments: {
                                "id": controller
                                    .daftarRiwayatModel.data[index].idSadari,
                                "from": "list",
                              });
                            },
                            backgroundColor: CustomColors.whiteGrey,
                          )
                          .margin(
                              horizontal:
                                  MediaQuery.of(context).size.height * .02);
                    },
                    separatorBuilder: (_, __) {
                      return CustomDivider(
                        height: MediaQuery.of(context).size.height * .02,
                      );
                    },
                    itemCount: controller.daftarRiwayatModel.data.length,
                  ),
              onLoading: ListView.separated(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04),
                itemBuilder: (_, __) {
                  return Skelaton(
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                  ).shimmer().margin(
                      horizontal: MediaQuery.of(context).size.height * .03);
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: MediaQuery.of(context).size.height * .02,
                  );
                },
                itemCount: 5,
              ), onError: (err) {
            return Center(
              child: Text(
                err.toString(),
                style: CustomFonts.montserratSemibold14,
              ),
            );
          }),
        ),
      ),
    );
  }
}
