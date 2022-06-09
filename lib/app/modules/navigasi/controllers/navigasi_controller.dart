import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigasiController extends GetxController {
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
