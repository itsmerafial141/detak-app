import 'package:detakapp/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/values/keys/storage_service_key.dart';
import '../../../routes/app_pages.dart';

class NavigasiController extends GetxController {
  StorageService storageService = Get.put(StorageService());

  var indexPageController = 0;
  var previousIndex = 0;
  String name = "";
  String phone = "";

  @override
  void onInit() {
    super.onInit();
    initializeProfile();
  }

  void changePageIndex(int index) {
    previousIndex = indexPageController;
    indexPageController = index;
    update();
  }

  void initializeProfile() {
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

  void onLogoutTapped() {
    storageService.erase(SSKey.userKey);
    Get.offAllNamed(AppPages.LG);
  }
}
