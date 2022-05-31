import 'package:detakapp/app/modules/home/models/berita_model.dart';
import 'package:detakapp/core/values/lists.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late List<BeritaModel> listBerita;

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
    for (int index = 0; index < CustomList.berita.length; index++) {
      var data = CustomList.berita[index];
      listBerita.add(
        BeritaModel(
          id: data['id'].toString(),
          title: data['title'].toString(),
          image: data['image'].toString(),
          content: data['content'].toString(),
          penulis: data['penulis'].toString(),
          kategori: data['kategori'].toString(),
          tanggal: data['tanggal'].toString(),
          waktu: data['waktu'].toString(),
        ),
      );
    }
  }

  List<BeritaModel> getDataByID(String id) {
    return listBerita.where((element) => element.id == id).toList();
  }
}
