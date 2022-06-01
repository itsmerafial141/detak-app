import 'dart:convert';

import 'package:detakapp/app/modules/profile/models/user_model.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  final url = 'https://detak.bgskr-project.my.id';

  Future<UserModel> login(
    String email,
    String password,
  ) async {
    final body = json.encode({
      "email": email,
      "password": password,
    });
    final response = await post(
      "https://detak.bgskr-project.my.id/api/user/login",
      body,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["status"] == true) {
        return userModelFromJson(response.bodyString.toString());
      } else {
        return Future.error(response.body["message"].toString());
      }
    }
  }
}
