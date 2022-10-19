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
    return SafeArea(
      child: Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kuestioner",
                style: CustomFonts.montserratBold18.copyWith(
                  color: CustomColors.primaryColor,
                ),
              ),
              controller.obx(
                (_) => Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.kuisonerModel.data.length,
                    (index) {
                      return Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Get.width),
                          child: ColoredBox(
                            color: controller.indexKusioner.value == index
                                ? CustomColors.primaryColor
                                : CustomColors.secondaryColor.withOpacity(0.5),
                            child: const SizedBox(
                              height: 4,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                onLoading: Skelaton(
                  height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                ).shimmer(),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (controller.indexKusioner == 0) {
                  controller.submitUmur(
                      controller.umur.value.toString(), context);
                } else {
                  controller.nextPageKusioner(context);
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: controller.obx(
                    (_) => Text(
                      controller.kuisonerModel
                          .data[controller.indexKusioner.value].contentQuestion,
                      textAlign: TextAlign.center,
                      style: CustomFonts.montserratMedium14,
                    ),
                    onLoading: Skelaton(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .8,
                    ).shimmer(),
                  ),
                ),
                CustomDivider(
                  height: MediaQuery.of(context).size.height * .02,
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
                                context: context,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .18,
                                height:
                                    MediaQuery.of(context).size.height * .05,
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
                                        minWidth: 200,
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                .1),
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
                                context: context,
                              ),
                            ],
                          )
                        : const SizedBox();
                  },
                  onLoading: Skelaton(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .5,
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
                                    answer: "Female",
                                    index: 1,
                                    context: context,
                                  );
                                },
                                image: "assets/icons/FE.png",
                                label: "WANITA",
                                context: context,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .1,
                              ),
                              _customGenderButton(
                                onTap: () {
                                  controller.submitAnswer(
                                    answer: "Male",
                                    index: 1,
                                    context: context,
                                  );
                                },
                                image: "assets/icons/MA.png",
                                label: "LAKI - LAKI",
                                context: context,
                              ),
                            ],
                          ).margin(top: MediaQuery.of(context).size.height * .1)
                        : const SizedBox();
                  },
                  onLoading: const SizedBox(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * .05,
                  ),
                  child: controller.obx(
                    (_) => Column(
                      children: [
                        controller.indexKusioner.value != 1
                            ? ElevatedButton(
                                onPressed: () {
                                  if (controller.indexKusioner.value == 0) {
                                    controller.submitUmur(
                                        controller.umur.value.toString(),
                                        context);
                                  } else {
                                    controller.submitAnswer(
                                        answer: "Yes",
                                        index: controller.indexKusioner.value,
                                        context: context);
                                  }
                                  // switch (controller.indexKusioner.value) {
                                  //   case 0:
                                  //     controller.submitUmur(
                                  //         controller.umur.value.toStrin,contextg());
                                  //     break;
                                  //   case 2:
                                  //     controller.submitAnswer(
                                  //         answer: "Yes", index: 2);
                                  //     break;
                                  //   case 3:
                                  //     controller.submitAnswer(
                                  //         answer: "Yes", index: 3);
                                  //     break;
                                  //   case 4:
                                  //     controller.submitAnswer(
                                  //         answer: "Yes", index: 4);
                                  //     break;
                                  //   case 5:
                                  //     controller.submitAnswer(
                                  //         answer: "Yes", index: 5);
                                  //     break;
                                  //   case 6:
                                  //     controller.submitAnswer(
                                  //         answer: "Yes", index: 6);
                                  //     break;
                                  // }
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
                                  if (controller.indexKusioner.value == 0) {
                                    controller.submitUmur(
                                        controller.umur.value.toString(),
                                        context);
                                  } else {
                                    controller.submitAnswer(
                                        answer: "No",
                                        index: controller.indexKusioner.value,
                                        context: context);
                                  }
                                  // switch (controller.indexKusioner.value) {
                                  //   case 2:
                                  //     controller.submitAnswer(
                                  //         answer: "No", index: 2);
                                  //     break;
                                  //   case 3:
                                  //     controller.submitAnswer(
                                  //         answer: "No", index: 3);
                                  //     break;
                                  //   case 4:
                                  //     controller.submitAnswer(
                                  //         answer: "No", index: 4);
                                  //     break;
                                  //   case 5:
                                  //     controller.submitAnswer(
                                  //         answer: "No", index: 5);
                                  //     break;
                                  //   case 6:
                                  //     controller.submitAnswer(
                                  //         answer: "No", index: 6);
                                  //     break;
                                  // }
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
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .8,
                        ),
                        CustomDivider(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Skelaton(
                          height: MediaQuery.of(context).size.height * .06,
                          width: MediaQuery.of(context).size.width * .8,
                        ),
                      ],
                    ).shimmer(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customGenderButton({
    required Function() onTap,
    required String image,
    required String label,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.height * .2,
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
              height: MediaQuery.of(context).size.height * .12,
              width: MediaQuery.of(context).size.height * .12,
              fit: BoxFit.fitHeight,
              image: AssetImage(image),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
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
    required BuildContext context,
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
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.height * .05,
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            icons,
            size: MediaQuery.of(context).size.height * .03,
            color: Colors.white,
          ),
        ),
      ).backgroundColor(color: CustomColors.primaryColor).borderRadius(all: 2),
    );
  }
}
