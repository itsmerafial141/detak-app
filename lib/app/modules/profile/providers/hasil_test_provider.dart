import 'package:detakapp/app/modules/profile/models/detail_riwayat_test_model.dart';
import 'package:get/get.dart';

class HasilTestProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';

  Future<DetailRiwayatTestModel> getHasilTestDetail(String id) async {
    final response = await get("$url/api/sadari/detail/$id");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] != false) {
        return detailRiwayatTestModelFromJson(response.bodyString.toString());
      } else {
        return Future.error(
          response.body["message"].toString(),
        );
      }
    }
  }
}
