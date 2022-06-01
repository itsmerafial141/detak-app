// ignore_for_file: avoid_print

import 'package:detakapp/app/modules/home/models/berita_model.dart';
import 'package:detakapp/app/modules/home/models/detail_berita_model.dart';
import 'package:detakapp/app/modules/home/providers/berita_provider.dart';
import 'package:get/get.dart';

import '../views/detail_berita_view.dart';

class HomeController extends GetxController with StateMixin {
  var beritaProvider = Get.put(BeritaProvider());

  List<BeritaModel> listBerita = List<BeritaModel>.empty().obs;
  late DetailBeritaModel dataDetailBerita;

  @override
  void onInit() {
    super.onInit();
    listBerita = [];
    _initialData();
  }

  @override
  void dispose() {
    super.dispose();
    listBerita.clear();
  }

  void _initialData() {
    try {
      beritaProvider.getBerita().then((value) {
        listBerita.add(
          BeritaModel(
            status: value.status,
            data: value.data,
          ),
        );
        print("${listBerita[0].data.length} <- beritaLength");
        print("berita success");
        change(null, status: RxStatus.success());
      }).onError((error, stackTrace) {
        error.printError();
        stackTrace.printError();
        print("berita OnError");
      }).whenComplete(() {
        print("berita whenComplete");
      });
    } catch (err) {
      err.printError();
    }
  }

  void detailBerita(String idNews) {
    try {
      beritaProvider.getDetailBerita(idNews).then((value) {
        print("detail berita success");
        dataDetailBerita = DetailBeritaModel(
          status: value.status,
          data: value.data,
        );
        Get.to(() => DetailBeritaView());
      }).onError((error, stackTrace) {
        error.printError();
        stackTrace.printError();
        print("detail berita onError");
      }).whenComplete(() {
        print("detail berita whenComplete");
      });
    } catch (err) {
      err.printError();
    }
  }

  String getTimeDetailBerita(String time) {
    return time.split(" ")[1].split('').getRange(0, 5).join('');
  }
}
