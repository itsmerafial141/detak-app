import 'package:detakapp/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// danngriel@gmail.com
// tes123

class AuthController extends GetxController {
  var loginProvider = Get.put(LoginProvider());

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
      try {
        login(
          dataUser["EMAIL"].toString(),
          dataUser["PASSWORD"].toString(),
        );
      } catch (err) {
        err.printError();
      }
    }
    update();
  }

  void login(String email, String password) {
    try {
      loginProvider
          .login(
        email,
        password,
      )
          .then(
        (value) {
          print("success");
          _saveToStorage(
            email: value.data.email,
            name: value.data.name,
            nameRole: value.data.nameRole,
            phone: value.data.phone,
            password: password,
          );
        },
      ).onError(
        (error, stackTrace) {
          print("onError");
          stackTrace.printError();
          error.printError();
          isDataNotExist = true;
        },
      ).whenComplete(
        () {
          update();
          print("whernComplete");
        },
      );
    } catch (err) {
      err.printError();
    }
  }

  void _saveToStorage({
    required String email,
    required String name,
    required String nameRole,
    required String phone,
    required String password,
  }) {
    GetStorage().write(
      "dataUser",
      {
        "EMAIL": email,
        "PASSWORD": password,
        "NAME": name,
        "NAME_ROLE": nameRole,
        "PROFILEPIC_USER": null,
        "PHONE": phone,
        "DATE_BIRTH": null
      },
    );
    isAuth = true;
    isDataNotExist = false;
    update();
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
