// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:detakapp/app/modules/home/models/berita_model.dart';
import 'package:detakapp/app/modules/home/models/berita_slider_model.dart';
import 'package:detakapp/app/modules/home/models/detail_berita_model.dart';
import 'package:detakapp/app/modules/home/providers/berita_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../widgets/custom_loading_dialog_widget.dart';
import '../views/detail_berita_view.dart';

class HomeController extends GetxController with StateMixin {
  var beritaProvider = Get.put(BeritaProvider());

  List<BeritaModel> listBerita = List<BeritaModel>.empty().obs;
  late DetailBeritaModel dataDetailBerita;
  late BeritaSliderModel dataBeritaSlide;

  late String nameUser = "";

  @override
  void onInit() {
    super.onInit();
    listBerita = [];
    initializeData();
  }

  @override
  void dispose() {
    super.dispose();
    listBerita.clear();
  }

  void initializeData() {
    _initialGetBeritaSlideData();
  }

  void _initialGetBeritaSlideData() {
    try {
      beritaProvider.getBeritalSlide().then((value) {
        dataBeritaSlide = BeritaSliderModel(
          status: value.status,
          data: value.data,
        );
        log("Get berita slide is success!");
        _initialGetBeritaData();
      }).onError((error, stackTrace) {
        error.printError();
        stackTrace.printError();
        log("Get berita slide is onError!");
        change(null,
            status: RxStatus.error(
                "Gagal mendapatkan berita, silahkan refresh halaman ini!"));
      }).whenComplete(() {
        log("Get berita slide complete execute!");
      });
    } catch (err) {
      err.printError();
    }
  }

  void _initialGetBeritaData() {
    try {
      beritaProvider.getBerita().then((value) {
        listBerita.add(
          BeritaModel(
            status: value.status,
            data: value.data,
          ),
        );
        nameUser = GetStorage().read("dataUser")["NAME"];
        change(null, status: RxStatus.success());
        log("Berita is success!");
      }).onError((error, stackTrace) {
        error.printError();
        stackTrace.printError();
        log("Berita is OnError!");
        change(null,
            status: RxStatus.error(
                "Gagal mendapatkan berita, silahkan refresh halaman ini!"));
      }).whenComplete(() {
        log("Berita is complete execute!");
      });
    } catch (err) {
      err.printError();
    }
  }

  void detailBerita(String idNews,BuildContext context) {
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
