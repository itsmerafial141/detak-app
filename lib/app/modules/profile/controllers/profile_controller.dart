// ignore_for_file: avoid_print

import 'package:detakapp/core/utils/helpers.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  double countTestMetter(int totalTest) {
    print(percentageOfScreenHeight(50) * value(totalTest) / 100);
    return percentageOfScreenHeight(48) * value(totalTest) / 100;
  }

  int value(int value) {
    return value - 30;
  }
}
