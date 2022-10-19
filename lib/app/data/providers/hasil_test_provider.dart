import 'package:detakapp/app/data/models/detail_riwayat_test_model.dart';
import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/services/base_service.dart';

class HasilTestProvider extends BaseService {
  Future<DetailRiwayatTestModel> getHasilTestDetail(String id) async {
    var response = await get("${EndPoint.detail}/$id");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] == false) {
        return Future.error(response.body["message"].toString());
      } else {
        return detailRiwayatTestModelFromJson(response.bodyString.toString());
      }
    }
  }
}
