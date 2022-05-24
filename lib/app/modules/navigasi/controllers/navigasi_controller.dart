import 'package:get/get.dart';

class NavigasiController extends GetxController {
  var indexPageController = 0;
  var previousIndex = 0;

  void changePageIndex(int index) {
    previousIndex = indexPageController;
    indexPageController = index;
    update();
  }
}
