import 'package:get/get.dart';

// import '../../daftar_riwayat/controllers/daftar_riwayat_controller.dart';
// import '../../home/controllers/home_controller.dart';
// import '../../profile/controllers/profile_controller.dart';
// import '../../test/controllers/test_controller.dart';

class NavigasiController extends GetxController {
  var indexPageController = 0;
  var previousIndex = 0;

  // List<Function()> listInitilaizeData = [];

  @override
  void onInit() {
    super.onInit();
    // listInitilaizeData.add(() => homeController.initializeData());
    // listInitilaizeData.add(() => testController.initializeData());
    // listInitilaizeData.add(() => profileController.initializeData());
    // listInitilaizeData.add(() => daftarRiwayatController.initializeData());
  }

  void changePageIndex(int index) {
    previousIndex = indexPageController;
    indexPageController = index;
    // switch (index) {
    //   case 3:
    //     DaftarRiwayatController().initializeData();
    // }
    // listInitilaizeData[index];
    update();
  }
}
