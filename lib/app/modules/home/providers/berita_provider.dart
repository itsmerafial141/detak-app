import 'dart:convert';

import 'package:detakapp/app/modules/home/models/berita_model.dart';
import 'package:detakapp/app/modules/home/models/detail_berita_model.dart';
import 'package:get/get.dart';

class BeritaProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';

  Future<BeritaModel> getBerita() async {
    final response = await get("$url/api/news");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() != "null") {
        return beritaModelFromJson(response.bodyString.toString());
      } else {
        return jsonDecode("null");
      }
    }
  }

  Future<DetailBeritaModel> getDetailBerita(String idNews) async {
    final response = await get("$url/api/news/detail/$idNews");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() != "null") {
        return detailBeritaModelFromJson(response.bodyString.toString());
      } else {
        return jsonDecode("null");
      }
    }
  }
}
