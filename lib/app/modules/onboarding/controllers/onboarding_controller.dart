import 'package:detakapp/app/modules/onboarding/screens/Screen_five.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_eight.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_eleven.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_four.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_nine.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_one.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_seven.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_six.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_three.dart';
import 'package:detakapp/app/modules/onboarding/screens/screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/screen_ten.dart';

class OnboardingController extends GetxController {
  var pageController = PageController().obs;
  var pageIndex = 0.obs;

  var pageView = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
    const ScreenFour(),
    const ScreenFive(),
    const ScreenSix(),
    const ScreenSeven(),
    const ScreenEight(),
    const ScreenNine(),
    const ScreenTen(),
    const ScreenEleven(),
  ];

  Widget showPage(int index) {
    return pageView[index];
  }

  void changeNextPage() {
    if (pageIndex < pageView.length - 1) {
      pageIndex += 1;
      changePageController();
      update();
    }
  }

  void changePageController() {
    pageController.value.animateToPage(
      pageIndex.value,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  void changeToPage(int index) {
    pageIndex.value = index;
    changePageController();
    update();
  }
}
