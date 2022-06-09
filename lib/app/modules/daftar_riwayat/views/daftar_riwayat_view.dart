// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/modules/daftar_riwayat/controllers/daftar_riwayat_controller.dart';
import 'package:detakapp/app/widgets/custom_app_bar_widget.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        label: "Daftar Riwayat",
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
        child: SizedBox(
          height: 100.sh - 45 - 60,
          width: 100.sw,
          child: controller.obx(
              (_) => ListView.separated(
                    padding: EdgeInsets.only(top: 4.sh, bottom: 4.sh),
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
                              style: CustomFonts.montserratRegular96,
                              maxLines: 1,
                            ),
                          ),
                          CustomDivider(
                            width: 2.sh,
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: controller
                                                  .daftarRiwayatModel
                                                  .data[index]
                                                  .totalScore
                                                  .toInt >
                                              15
                                          ? CustomColors.red
                                          : CustomColors.green,
                                      size: 5.sh,
                                    ),
                                    CustomDivider(
                                      width: 1.sh,
                                    ),
                                    AutoSizeText(
                                      controller.daftarRiwayatModel.data[index]
                                          .hasilSadari,
                                      maxLines: 1,
                                      style: CustomFonts.montserratBold16,
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                          style:
                                              CustomFonts.montserratRegular10,
                                        ),
                                        AutoSizeText(
                                          controller.daftarRiwayatModel
                                              .data[index].dateSadari
                                              .toString()
                                              .formatedDate("h:mm a"),
                                          maxLines: 1,
                                          style:
                                              CustomFonts.montserratRegular10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                CustomDivider(
                                  height: 2.sh,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomText(
                                    controller.daftarRiwayatModel.data[index]
                                        .keterangan
                                        .split(":")[0],
                                    style: CustomFonts.montserratBold12,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          .paddingSymmetric(horizontal: 2.sh)
                          // .backgroundColor(color: CustomColors.whiteGrey)
                          .borderRadius(all: 10)
                          .button(
                            onPressed: () {
                              Get.toNamed(AppPages.HT, arguments: {
                                "id": controller
                                    .daftarRiwayatModel.data[index].idSadari,
                              });
                            },
                            backgroundColor: CustomColors.whiteGrey,
                          )
                          .margin(horizontal: 2.sh);
                    },
                    separatorBuilder: (_, __) {
                      return CustomDivider(
                        height: 2.sh,
                      );
                    },
                    itemCount: controller.daftarRiwayatModel.data.length,
                  ),
              onLoading: ListView.separated(
                padding: EdgeInsets.only(top: 4.sh),
                itemBuilder: (_, __) {
                  return Skelaton(
                    height: 20.sh,
                    width: double.infinity,
                  ).shimmer().margin(horizontal: 3.sh);
                },
                separatorBuilder: (_, __) {
                  return CustomDivider(
                    height: 2.sh,
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
