// ignore_for_file: avoid_print

import 'package:detakapp/core/utils/helpers.dart';
import 'package:detakapp/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/values/keys/storage_service_key.dart';

class ProfileController extends GetxController {
  StorageService storageService = Get.put(StorageService());

  double countTestMetter(int totalTest) {
    print(percentageOfScreenHeight(50) * value(totalTest) / 100);
    return percentageOfScreenHeight(48) * value(totalTest) / 100;
  }

  int value(int value) {
    return value - 30;
  }

  String name = "";
  String phone = "";

  void initializeData() {
    var service = GetStorage();
    if (service.read("dataUser") != null) {
      var dataUser = storageService.read(SSKey.userKey);
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
