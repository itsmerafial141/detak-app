// ignore_for_file: avoid_print

import 'package:detakapp/core/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  double countTestMetter(int totalTest) {
    print(percentageOfScreenHeight(50) * value(totalTest) / 100);
    return percentageOfScreenHeight(48) * value(totalTest) / 100;
  }

  int value(int value) {
    return value - 30;
  }

  String name = "";
  String phone = "";

  void initializeProfile() {
    var service = GetStorage();
    if (service.read("dataUser") != null) {
      var dataUser = GetStorage().read("dataUser");
      name = dataUser["NAME"];
      phone = dataUser["PHONE"];
      update();
    }
  }

  String getCapitalizeString(String str) {
    String cRet = '';
    str.split(' ').forEach((word) {
      cRet += "${word[0].toUpperCase()}${word.substring(1).toLowerCase()} ";
    });
    return cRet.trim();
  }
}
