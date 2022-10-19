import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/services/base_service.dart';

import '../models/daftar_riwayat_model.dart';

class DaftarRiwayatProvider extends BaseService {
  Future<DaftarRiwayatModel> getDaftarRiwayat({required String email}) async {
    var response = await get("${EndPoint.riwayat}?email=$email");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] == false) {
        return Future.error(response.body["message"].toString());
      } else {
        return daftarRiwayatModelFromJson(response.bodyString.toString());
      }
    }
  }
}
