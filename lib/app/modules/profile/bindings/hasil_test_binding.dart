import '../controllers/hasil_test_controller.dart';
import 'package:get/get.dart';

class HasilTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilTestController>(
      () => HasilTestController(),
    );
  }
}
