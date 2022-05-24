import 'package:get/get.dart';

class NavigasiController extends GetxController {
  var indexPageController = 0;

  void changePageIndex(int index) {
    indexPageController = index;
    update();
  }
}
