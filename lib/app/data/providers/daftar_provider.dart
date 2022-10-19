import 'package:detakapp/app/data/models/daftar_model.dart';
import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/services/base_service.dart';

class DaftarProvider extends BaseService {
  Future<DaftarModel> daftar(
    String nama,
    String email,
    String phone,
    String password,
  ) async {
    final body = {
      "name": nama,
      "email": email,
      "phone": phone,
      "password": password,
    };
    final response = await post(EndPoint.register, body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return daftarModelFromJson(response.bodyString.toString());
    }
  }
}
