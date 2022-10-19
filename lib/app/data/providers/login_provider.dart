import 'package:detakapp/app/data/models/user_model.dart';
import 'package:detakapp/core/values/keys/end_point_key.dart';
import 'package:detakapp/core/values/strings.dart';

import '../../../services/base_service.dart';

class LoginProvider extends BaseService {
  Future<UserModel> login(
    String email,
    String password,
  ) async {
    final body = {
      "email": email,
      "password": password,
    };
    var response = await post(EndPoint.login, body);
    if (response.body == null) {
      return Future.error(MyError.errorMessage);
    } else {
      if (response.body["status"] == false) {
        return Future.error(response.body["message"].toString());
      } else {
        return userModelFromJson(response.bodyString.toString());
      }
    }
  }
}
