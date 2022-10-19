// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:detakapp/app/data/models/berita_model.dart';
import 'package:detakapp/app/data/models/berita_slider_model.dart';
import 'package:detakapp/app/data/models/detail_berita_model.dart';
import 'package:detakapp/app/data/providers/berita_provider.dart';
import 'package:detakapp/app/widgets/my_raw_snackbar.dart';
import 'package:detakapp/core/values/keys/response_code_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/values/keys/storage_service_key.dart';
import '../../../../services/storage_service.dart';
import '../../../widgets/custom_loading_dialog_widget.dart';
import '../views/detail_berita_view.dart';

class HomeController extends GetxController with StateMixin {
  StorageService storageService = Get.put(StorageService());
  var beritaProvider = Get.put(BeritaProvider());

  late BeritaModel listBerita;
  late DetailBeritaModel dataDetailBerita;
  late BeritaSliderModel dataBeritaSlide;

  late String nameUser = "";

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    _initialGetBeritaSlideData()
        .then(
      (_) => change(
        null,
        status: RxStatus.success(),
      ),
    )
        .onError((error, stackTrace) {
      change(
        null,
        status: RxStatus.error(
          "Gagal mendapatkan data, silahkan refresh halaman ini!",
        ),
      );
      MyRawSnackBar.rawSanckBar(
        statusCode: RespCode.error,
        message: "Gagal mendapatkan data, silahkan refresh halaman ini!",
      );
    });
  }

  Future<bool> _initialGetBeritaSlideData() async {
    await beritaProvider.getBeritalSlide().then((value) {
      dataBeritaSlide = BeritaSliderModel(
        status: value.status,
        data: value.data,
      );
      log("Get berita slide is success!");
    }).onError((error, stackTrace) {
      error.printError();
      stackTrace.printError();
      log("Get berita slide is onError!");
      return Future.error("Get berita slide is onError");
    });
    await beritaProvider.getBerita().then((value) {
      listBerita = value;
      nameUser = storageService.read(SSKey.userKey)["NAME"];
      change(null, status: RxStatus.success());
      log("Berita is success!");
    }).onError((error, stackTrace) {
      error.printError();
      stackTrace.printError();
      log("Berita is OnError!");
      change(
        null,
        status: RxStatus.error(
          "Gagal mendapatkan berita, silahkan refresh halaman ini!",
        ),
      );
      return Future.error("Berita is OnError");
    });
    return true;
  }

  void detailBerita(String idNews, BuildContext context) {
    CustomLoadingDialog.customLoadingDialog(context);
    try {
      beritaProvider.getDetailBerita(idNews).then((value) {
        dataDetailBerita = DetailBeritaModel(
          status: value.status,
          data: value.data,
        );
        Get.back();
        Get.to(() => DetailBeritaView());
        log("Detail Berita is success!");
      }).onError((error, stackTrace) {
        error.printError();
        stackTrace.printError();
        log("Detail Berita is onError!");
      }).whenComplete(() {
        log("Detail Berita is complete execute!");
      });
    } catch (err) {
      err.printError();
    }
  }

  String getTimeDetailBerita(String time) {
    return time.split(" ")[1].split('').getRange(0, 5).join('');
  }
}
