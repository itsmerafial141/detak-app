import 'package:detakapp/app/modules/profile/models/daftar_riwayat_model.dart';
import 'package:get/get.dart';

class DaftarRiwayatProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';

  Future<DaftarRiwayatModel> getDaftarRiwayat({required String email}) async {
    final response = await get("$url/api/sadari/riwayat?email=$email");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] != false) {
        return daftarRiwayatModelFromJson(response.bodyString.toString());
      } else {
        return Future.error(
          response.body["message"].toString(),
        );
      }
    }
  }
}
