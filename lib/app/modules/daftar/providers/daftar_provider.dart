import 'dart:convert';

import 'package:detakapp/app/modules/daftar/models/daftar_model.dart';
import 'package:get/get.dart';

class DaftarProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';

  Future<DaftarModel> daftar(
    String nama,
    String email,
    String phone,
    String password,
  ) async {
    final body = json.encode({
      "name": nama,
      "email": email,
      "phone": phone,
      "password": password,
    });
    final response = await post("$url/api/user/register", body);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return daftarModelFromJson(response.bodyString.toString());
    }
  }
}
