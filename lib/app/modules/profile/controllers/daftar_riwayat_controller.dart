import 'dart:developer';

import 'package:detakapp/app/modules/profile/models/daftar_riwayat_model.dart';
import 'package:detakapp/app/modules/profile/providers/daftar_riwayat_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DaftarRiwayatController extends GetxController with StateMixin {
  var daftarRiwayatProvider = Get.put(DaftarRiwayatProvider());

  late DaftarRiwayatModel daftarRiwayatModel;

  @override
  void onInit() {
    super.onInit();
    final service = GetStorage();
    try {
      if (service.read("dataUser") != null) {
        var data = service.read("dataUser");
        daftarRiwayatProvider
            .getDaftarRiwayat(email: data["EMAIL"])
            .then((value) {
          daftarRiwayatModel = DaftarRiwayatModel(
            status: value.status,
            data: value.data,
          );
          log("Daftar Riwayat success!");
          change(null, status: RxStatus.success());
        }).onError((error, stackTrace) {
          error.printError();
          stackTrace.printError();
          log("Daftar Riwayat onError!");
          change(null, status: RxStatus.error(error.toString()));
        }).whenComplete(() {
          log("Daftar Riwayat complete!");
        });
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (err) {
      err.printError();
    }
  }

  String datePicker({required String value, required int index}) {
    return value.split(' ')[index];
  }
}
