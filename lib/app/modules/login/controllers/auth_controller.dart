import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var isAuth = false;
  var isDataNotExist = false;

  final Map<String, String> _dataUser = {
    "id": "AD001",
    "email": "admin@gmail.com",
    "password": "admin1234"
  };

  Future<void> autoLoginUser() async {
    final service = GetStorage();
    if (service.read("dataUser") != null) {
      var dataUser = GetStorage().read("dataUser");
      login(
        dataUser["email"].toString(),
        dataUser["password"].toString(),
      );
    }
    update();
  }

  void login(String email, String password) {
    if (emailCheckFromDB(email) && passwordCheckFromDB(password)) {
      final service = GetStorage();
      service.write(
        "dataUser",
        {
          "id": "AD001",
          "email": email,
          "password": password,
        },
      );
      isAuth = true;
      isDataNotExist = false;
      update();
    } else {
      isDataNotExist = true;
      print("asd");
      update();
    }
  }

  void logout() {
    if (storageIsNotNull("dataUser")) {
      GetStorage().erase();
      isAuth = false;
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
    isDataNotExist = false;
  }

  bool emailCheckFromDB(String email) {
    return email.contains(_dataUser['email'].toString());
  }

  bool passwordCheckFromDB(String password) {
    return password.contains(_dataUser['password'].toString());
  }

  bool storageIsNotNull(String key) {
    final box = GetStorage();
    return box.read(key) != null;
  }
}
