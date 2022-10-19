import 'package:detakapp/app/data/models/berita_model.dart';
import 'package:detakapp/app/data/models/berita_slider_model.dart';
import 'package:detakapp/app/data/models/detail_berita_model.dart';
import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/services/base_service.dart';

class BeritaProvider extends BaseService {
  Future<BeritaModel> getBerita() async {
    var response = await get(EndPoint.news);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() == "null") {
        return Future.error(response.statusText.toString());
      } else {
        return beritaModelFromJson(response.bodyString.toString());
      }
    }
  }

  Future<DetailBeritaModel> getDetailBerita(String idNews) async {
    var response = await get("${EndPoint.newsDetail}/$idNews");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() == "null") {
        return Future.error(response.statusText.toString());
      } else {
        return detailBeritaModelFromJson(response.bodyString.toString());
      }
    }
  }

  Future<BeritaSliderModel> getBeritalSlide() async {
    var response = await get(EndPoint.slider);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.bodyString.toString() == "null") {
        return Future.error(response.body.toString());
      } else {
        return beritaSliderModelFromJson(response.bodyString.toString());
      }
    }
  }
}
