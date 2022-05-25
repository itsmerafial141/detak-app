import 'package:get/get.dart';

import '../controllers/kusioner_controller.dart';

class KusionerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KusionerController>(
      () => KusionerController(),
    );
  }
}
