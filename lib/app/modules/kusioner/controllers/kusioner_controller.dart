// ignore_for_file: avoid_print

import 'package:detakapp/app/modules/kusioner/views/hasil_view.dart';
import 'package:get/get.dart';

class KusionerController extends GetxController {
  var listKusioner = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non tellus dapibus, venenatis nisl at, blandit nunc. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non tellus dapibus, venenatis nisl at, blandit nunc. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non tellus dapibus, venenatis nisl at, blandit nunc. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non tellus dapibus, venenatis nisl at, blandit nunc. ",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non tellus dapibus, venenatis nisl at, blandit nunc. ",
  ];
  late List kusionerAnswer;
  var indexKusioner = 0;

  @override
  void onInit() {
    super.onInit();
    kusionerAnswer = [];
  }

  @override
  void dispose() {
    super.dispose();
    kusionerAnswer.clear();
    listKusioner.clear();
  }

  void previousPageKusioner() {
    if (indexKusioner != 0) {
      indexKusioner -= 1;
      print(indexKusioner);
    } else {
      Get.back();
    }
    update();
    print("asd");
  }

  void nextPageKusioner() {
    if (indexKusioner < listKusioner.length - 1) {
      indexKusioner += 1;
      print(indexKusioner);
      update();
    }
  }

  void answerKusioner(bool answer) {
    if (indexKusioner < listKusioner.length - 1) {
      indexKusioner += 1;
      kusionerAnswer.add(answer);
      update();
    } else {
      Get.to(const HasilView());
    }
  }
}
