// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:detakapp/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// danngriel@gmail.com
// tes123

class AuthController extends GetxController {
  var loginProvider = Get.put(LoginProvider());

  var isAuth = false.obs;
  var isDataNotExist = "";

  Future<void> autoLoginUser() async {
    if (storageIsNotNull("dataUser")) {
      var dataUser = GetStorage().read("dataUser");
      login(
        dataUser["EMAIL"].toString(),
        dataUser["PASSWORD"].toString(),
      );
    }
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
          log("success");
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
          log("onError");
          stackTrace.printError();
          log(error.toString());
          isDataNotExist = error.toString();
        },
      ).whenComplete(
        () {
          Get.back();
          update();
          log("whernComplete");
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
    isAuth.value = true;
    isDataNotExist = "";
  }

  void logout() {
    if (storageIsNotNull("dataUser")) {
      GetStorage().erase();
      isAuth.value = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDataNotExist = "";
  }

  bool storageIsNotNull(String key) {
    final box = GetStorage();
    return box.read(key) != null;
  }
}
