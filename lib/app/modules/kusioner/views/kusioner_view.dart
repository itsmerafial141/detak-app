// ignore_for_file: unrelated_type_equality_checks

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
              height: percentageOfScreenHeight(1),
            ),
            SizedBox(
              height: percentageOfScreenHeight(0.5),
              width: percentageOfScreenWidth(60),
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
                                height: percentageOfScreenHeight(0.5),
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
              controller.nextPageKusioner();
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
          width: percentageOfScreenWidth(100),
          height:
              percentageOfScreenHeight(100) + Get.mediaQuery.viewPadding.top,
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                width: percentageOfScreenWidth(70),
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
                      ? SizedBox(
                          width: 10.sh,
                          child: TextField(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (controller.umurController.text.toInt >
                                    150) {
                                  controller.umurController.text = "150";
                                }
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                constraints: BoxConstraints(minWidth: 10.sh)),
                            maxLines: 1,
                            maxLength: 3,
                            controller: controller.umurController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                              LengthLimitingTextInputFormatter(3),
                            ],
                          ),
                        )
                      : const SizedBox();
                },
                onLoading: Skelaton(
                  height: 5.sh,
                  width: 50.sw,
                ).shimmer(),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenHeight(5),
                ),
                child: controller.obx(
                  (_) => Column(
                    children: [
                      controller.indexKusioner.value != 0
                          ? ElevatedButton(
                              onPressed: () {
                                switch (controller.indexKusioner.value) {
                                  case 1:
                                    controller.submitAnswer(
                                        answer: "Female", index: 1);
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
                                controller.indexKusioner == 1
                                    ? "PEREMPUAN"
                                    : "YA",
                                style: CustomFonts.montserratBold14.copyWith(
                                  color: CustomColors.primaryColor,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: percentageOfScreenHeight(1),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          switch (controller.indexKusioner.value) {
                            case 0:
                              controller
                                  .submitUmur(controller.umurController.text);
                              break;
                            case 1:
                              controller.submitAnswer(answer: "Male", index: 1);
                              break;
                            case 2:
                              controller.submitAnswer(answer: "No", index: 2);
                              break;
                            case 3:
                              controller.submitAnswer(answer: "No", index: 3);
                              break;
                            case 4:
                              controller.submitAnswer(answer: "No", index: 4);
                              break;
                            case 5:
                              controller.submitAnswer(answer: "No", index: 5);
                              break;
                            case 6:
                              controller.submitAnswer(answer: "No", index: 6);
                              break;
                          }
                        },
                        child: Text(controller.indexKusioner.value == 0
                            ? "LANJUT"
                            : controller.indexKusioner == 1
                                ? "LAKI - LAKI"
                                : "TIDAK"),
                      )
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
}
