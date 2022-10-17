import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: controller.pageController.value,
                    // physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: controller.pageIndex,
                    itemCount: controller.pageView.length,
                    itemBuilder: (_, index) {
                      return controller.showPage(index);
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Center(
                child: Obx(
                  () => AnimatedSmoothIndicator(
                    // onDotClicked: (index) {
                    //   controller.changeToPage(index);
                    // },
                    activeIndex: controller.pageIndex.value,
                    count: controller.pageView.length,
                    effect: ExpandingDotsEffect(
                      dotColor: CustomColors.primaryColor.withOpacity(
                        0.5,
                      ),
                      activeDotColor: CustomColors.primaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          controller.pageIndex.value !=
                                  controller.pageView.length - 1
                              ? controller.changeNextPage()
                              : Get.offAllNamed(AppPages.LG);
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          overlayColor: MaterialStateProperty.all(
                            CustomColors.black.withOpacity(0.1),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size.fromHeight(
                                MediaQuery.of(context).size.height * .08),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(CustomColors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          controller.pageIndex.value !=
                                  controller.pageView.length - 1
                              ? "Lanjut"
                              : "Masuk",
                          style: CustomFonts.montserratBold12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .02),
                  Obx(
                    () {
                      return controller.pageIndex.value !=
                              controller.pageView.length - 1
                          ? SizedBox(
                              width: MediaQuery.of(context).size.height * .2,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(AppPages.LG);
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  overlayColor: MaterialStateProperty.all(
                                    CustomColors.black.withOpacity(0.1),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    Size.fromHeight(
                                        MediaQuery.of(context).size.height *
                                            .08),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      CustomColors.primaryColor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Skip",
                                  style: CustomFonts.montserratBold12.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  )
                ],
              ).margin(all: MediaQuery.of(context).size.width * .02),
            ],
          ),
        ),
      ),
    );
  }
}
