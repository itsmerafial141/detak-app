import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';

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
              child: Row(
                children: List.generate(
                  controller.listKusioner.length,
                  (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Get.width),
                          child: GetBuilder<KusionerController>(
                            init: KusionerController(),
                            builder: (_) {
                              return ColoredBox(
                                color: controller.indexKusioner == index
                                    ? CustomColors.primaryColor
                                    : CustomColors.secondaryColor
                                        .withOpacity(0.5),
                                child: SizedBox(
                                  height: percentageOfScreenHeight(0.5),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
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
                child: Text(
                  controller.listKusioner[0],
                  style: CustomFonts.montserratMedium14,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenHeight(5),
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.answerKusioner(true);
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
                        "YA",
                        style: CustomFonts.montserratBold14.copyWith(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: percentageOfScreenHeight(1),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.answerKusioner(false);
                      },
                      child: const Text("TIDAK"),
                    ),
                  ],
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
