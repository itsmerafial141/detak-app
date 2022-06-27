import 'package:detakapp/app/routes/app_pages.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/theme/fonts.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.sh + Get.mediaQuery.viewPadding.top,
          width: 100.sw,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100.sw,
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
              SizedBox(height: 1.sh),
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
              SizedBox(height: 1.sh),
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
                            Size.fromHeight(8.sh),
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
                  SizedBox(width: 2.sw),
                  Obx(
                    () {
                      return controller.pageIndex.value !=
                              controller.pageView.length - 1
                          ? SizedBox(
                              width: 20.sw,
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
                                    Size.fromHeight(8.sh),
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
              ).margin(all: 2.sw),
            ],
          ),
        ),
      ),
    );
  }
}
