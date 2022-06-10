// ignore_for_file: unrelated_type_equality_checks

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/skelaton_widget.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/kusioner_controller.dart';

class KusionerView extends GetView<KusionerController> {
  const KusionerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            controller.previousPageKusioner();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomColors.primaryColor,
          ),
        ),
        title: Column(
          children: [
            Text(
              "Kuestioner",
              style: CustomFonts.montserratBold18.copyWith(
                color: CustomColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 1.sh,
            ),
            SizedBox(
              height: 0.5.sh,
              width: 60.sw,
              child: controller.obx(
                (_) => Row(
                  children: List.generate(
                    controller.kuisonerModel.data.length,
                    (index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Get.width),
                            child: ColoredBox(
                              color: controller.indexKusioner.value == index
                                  ? CustomColors.primaryColor
                                  : CustomColors.secondaryColor
                                      .withOpacity(0.5),
                              child: SizedBox(
                                height: 0.5.sh,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                onLoading: Skelaton(
                  height: 20.sh,
                  width: double.infinity,
                ).shimmer(),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (controller.indexKusioner == 0) {
                controller.submitUmur(controller.umur.value.toString());
              } else {
                controller.nextPageKusioner();
              }
            },
            icon: Icon(
              Icons.arrow_forward_rounded,
              color: CustomColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.sw,
          height: 100.sh + Get.mediaQuery.viewPadding.top,
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                width: 70.sw,
                child: controller.obx(
                  (_) => Text(
                    controller.kuisonerModel
                        .data[controller.indexKusioner.value].contentQuestion,
                    textAlign: TextAlign.center,
                    style: CustomFonts.montserratMedium14,
                  ),
                  onLoading: Skelaton(
                    height: 5.sh,
                    width: 80.sw,
                  ).shimmer(),
                ),
              ),
              CustomDivider(
                height: 2.sh,
              ),
              controller.obx(
                (_) {
                  return controller.indexKusioner == 0
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _umurButton(
                              onTap: () {
                                controller.decrement();
                              },
                              onLongPress: () {},
                              icons: Icons.remove_rounded,
                              onTapPressed: (TapDownDetails details) {
                                controller.autoDecrement();
                              },
                            ),
                            SizedBox(
                              width: 18.sw,
                              height: 5.sh,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (controller.umurController.text.toInt >
                                        150) {
                                      controller.umurController.text = "150";
                                    }
                                  } else {
                                    controller.umurController.text = "0";
                                  }
                                  controller.umur.value =
                                      controller.umurController.text.toInt;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  constraints: BoxConstraints(
                                      minWidth: 200, maxHeight: 10.sh),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: CustomColors.umurTotalBackground,
                                ),
                                maxLines: 1,
                                controller: controller.umurController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]")),
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                            _umurButton(
                              onTap: () {
                                controller.increment();
                              },
                              icons: Icons.add_rounded,
                              onTapPressed: (TapDownDetails details) {
                                controller.autoIncrement();
                              },
                            ),
                          ],
                        )
                      : const SizedBox();
                },
                onLoading: Skelaton(
                  height: 5.sh,
                  width: 50.sw,
                ).shimmer(),
              ),
              controller.obx(
                (_) {
                  return controller.indexKusioner == 1
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _customGenderButton(
                              onTap: () {
                                controller.submitAnswer(
                                    answer: "Female", index: 1);
                              },
                              image: "assets/icons/FE.png",
                              label: "WANITA",
                            ),
                            SizedBox(
                              width: 10.sw,
                            ),
                            _customGenderButton(
                              onTap: () {
                                controller.submitAnswer(
                                    answer: "Male", index: 1);
                              },
                              image: "assets/icons/MA.png",
                              label: "LAKI - LAKI",
                            ),
                          ],
                        ).margin(top: 10.sh)
                      : const SizedBox();
                },
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.sh,
                ),
                child: controller.obx(
                  (_) => Column(
                    children: [
                      controller.indexKusioner.value != 1
                          ? ElevatedButton(
                              onPressed: () {
                                switch (controller.indexKusioner.value) {
                                  case 0:
                                    controller.submitUmur(
                                        controller.umur.value.toString());
                                    break;
                                  case 2:
                                    controller.submitAnswer(
                                        answer: "Yes", index: 2);
                                    break;
                                  case 3:
                                    controller.submitAnswer(
                                        answer: "Yes", index: 3);
                                    break;
                                  case 4:
                                    controller.submitAnswer(
                                        answer: "Yes", index: 4);
                                    break;
                                  case 5:
                                    controller.submitAnswer(
                                        answer: "Yes", index: 5);
                                    break;
                                  case 6:
                                    controller.submitAnswer(
                                        answer: "Yes", index: 6);
                                    break;
                                }
                                // controller.answerKusioner(true);
                              },
                              child: Text(
                                controller.indexKusioner.value == 0
                                    ? "LANJUT"
                                    : "YA",
                                style: CustomFonts.montserratBold14.copyWith(
                                  color: CustomColors.white,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: percentageOfScreenHeight(1),
                      ),
                      Obx(() => controller.indexKusioner.value > 1
                          ? ElevatedButton(
                              onPressed: () {
                                switch (controller.indexKusioner.value) {
                                  case 2:
                                    controller.submitAnswer(
                                        answer: "No", index: 2);
                                    break;
                                  case 3:
                                    controller.submitAnswer(
                                        answer: "No", index: 3);
                                    break;
                                  case 4:
                                    controller.submitAnswer(
                                        answer: "No", index: 4);
                                    break;
                                  case 5:
                                    controller.submitAnswer(
                                        answer: "No", index: 5);
                                    break;
                                  case 6:
                                    controller.submitAnswer(
                                        answer: "No", index: 6);
                                    break;
                                }
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              child: Text(
                                "TIDAK",
                                style: TextStyle(
                                  color: CustomColors.primaryColor,
                                ),
                              ),
                            )
                          : const SizedBox()),
                    ],
                  ),
                  onLoading: Column(
                    children: [
                      Skelaton(
                        height: 6.sh,
                        width: 80.sw,
                      ),
                      CustomDivider(
                        height: 2.sh,
                      ),
                      Skelaton(
                        height: 6.sh,
                        width: 80.sw,
                      ),
                    ],
                  ).shimmer(),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customGenderButton({
    required Function() onTap,
    required String image,
    required String label,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 20.sh,
        width: 20.sh,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 2,
            color: CustomColors.primaryColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 12.sh,
              width: 12.sh,
              fit: BoxFit.fitHeight,
              image: AssetImage(image),
            ),
            SizedBox(
              height: 1.sh,
            ),
            AutoSizeText(
              label,
              maxLines: 1,
              // textAlign: TextAlign.center,
              style: CustomFonts.montserratBold14.copyWith(
                color: CustomColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _umurButton({
    required Function() onTap,
    required Function(TapDownDetails details) onTapPressed,
    Function()? onLongPress,
    required IconData icons,
  }) {
    return GestureDetector(
      onTapDown: onTapPressed,
      onTapUp: (TapUpDetails details) {
        controller.onTapOut();
      },
      onTapCancel: () {
        controller.onTapOut();
      },
      onTap: onTap,
      child: SizedBox(
        height: 5.sh,
        width: 5.sh,
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            icons,
            size: 3.sh,
            color: Colors.white,
          ),
        ),
      ).backgroundColor(color: CustomColors.primaryColor).borderRadius(all: 2),
    );
  }
}
