import 'dart:developer';

import 'package:detakapp/app/modules/profile/models/detail_riwayat_test_model.dart';
import 'package:detakapp/app/modules/profile/providers/hasil_test_provider.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helpers.dart';

class HasilTestController extends GetxController with StateMixin {
  var htdProvider = Get.put(HasilTestProvider());

  var idData = Get.arguments["id"];

  var scorIndicator = 0;

  late DetailRiwayatTestModel listDataHasilTest;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    try {
      htdProvider.getHasilTestDetail(idData.toString()).then((value) {
        log("Detail riwayat test success!");
        listDataHasilTest = DetailRiwayatTestModel(
          status: value.status,
          data: value.data,
        );
        if (listDataHasilTest.data.dataSadari[0].totalScore.toInt < 0) {
          scorIndicator = 0;
        } else if (listDataHasilTest.data.dataSadari[0].totalScore.toInt > 32) {
          scorIndicator = 16;
        } else {
          scorIndicator = (listDataHasilTest.data.dataSadari[0].totalScore.toInt*0.5).floor();
        }
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
    return (percentageOfScreenWidth(35) *
        (totalTest < 0 ? 0 : totalTest) /
        100);
  }
}
