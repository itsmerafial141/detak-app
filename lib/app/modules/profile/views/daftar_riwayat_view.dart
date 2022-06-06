import 'package:detakapp/app/modules/profile/controllers/daftar_riwayat_controller.dart';
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
  const DaftarRiwayatView({Key? key}) : super(key: key);

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
          height: 100.sh - 45,
          width: 100.sw,
          child: controller.obx(
              (_) => ListView.separated(
                    padding: EdgeInsets.only(top: 4.sh),
                    itemBuilder: (_, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomText(
                              controller
                                  .daftarRiwayatModel.data[index].totalScore,
                              style: CustomFonts.montserratRegular96,
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
                                      color: CustomColors.green,
                                      size: 5.sh,
                                    ),
                                    CustomDivider(
                                      width: 2.sh,
                                    ),
                                    CustomText(
                                      controller.daftarRiwayatModel.data[index]
                                          .hasilSadari,
                                      style: CustomFonts.montserratBold20,
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          controller
                                              .datePicker(
                                                  value: controller
                                                      .daftarRiwayatModel
                                                      .data[0]
                                                      .dateSadari
                                                      .toString(),
                                                  index: 0)
                                              .formatedDate("d MMMM yyyy"),
                                          style: CustomFonts.montserratBold12,
                                        ),
                                        CustomText(
                                          controller.daftarRiwayatModel.data[0]
                                              .dateSadari
                                              .toString()
                                              .formatedDate("h:mm a"),
                                          style: CustomFonts.montserratBold12,
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
