import '../controllers/daftar_riwayat_controller.dart';
import 'package:get/get.dart';

class DaftarRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarRiwayatController>(
      () => DaftarRiwayatController(),
    );
  }
}
