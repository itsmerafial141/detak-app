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
    super.onInit();
    try {
      _initializeHasilTestDetail();
    } catch (err) {
      err.printError();
    }
  }

  void _initializeHasilTestDetail() {
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
  }

  double countTestMetter(int totalTest) {
    return percentageOfScreenWidth(40) * totalTest / 100;
  }
}
