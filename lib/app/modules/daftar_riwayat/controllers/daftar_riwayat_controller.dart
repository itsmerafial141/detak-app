import 'dart:developer';

import 'package:detakapp/app/data/providers/daftar_riwayat_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/daftar_riwayat_model.dart';

class DaftarRiwayatController extends GetxController with StateMixin {
  var daftarRiwayatProvider = Get.put(DaftarRiwayatProvider());

  late DaftarRiwayatModel daftarRiwayatModel;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    try {
      final service = GetStorage();
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
