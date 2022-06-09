import 'dart:developer';

import 'package:detakapp/app/modules/profile/models/detail_riwayat_test_model.dart';
import 'package:detakapp/app/modules/profile/providers/hasil_test_provider.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helpers.dart';

class HasilTestController extends GetxController with StateMixin {
  var htdProvider = Get.put(HasilTestProvider());

  var idData = Get.arguments["id"];

  late DetailRiwayatTestModel listDataHasilTest;

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  void initializeData() {
    try {
      htdProvider.getHasilTestDetail(idData.toString()).then((value) {
        log("Detail riwayat test success!");
        listDataHasilTest = DetailRiwayatTestModel(
          status: value.status,
          data: value.data,
        );
        change(null, status: RxStatus.success());
      }).onError((error, stackTrace) {
        log("Detail riwayat test onError!");
        change(null, status: RxStatus.error(error.toString()));
      }).whenComplete(() {
        log("Detail riwayat test onComplete!");
      });
    } catch (err) {
      err.printError();
    }
  }

  double countTestMetter(int totalTest) {
    return (percentageOfScreenWidth(35) * totalTest / 100);
  }
}
