// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:detakapp/app/modules/login/controllers/login_controller.dart';
import 'package:detakapp/app/modules/login/providers/login_provider.dart';
import 'package:detakapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// danngriel@gmail.com
// tes123

class AuthController extends GetxController {
  var loginProvider = Get.put(LoginProvider());

  var profileController = Get.put(ProfileController());
  var loginController = Get.put(LoginController());

  var isAuth = false.obs;
  var isDataNotExist = "";

  var keepAwakae = false;

  Future<void> autoLoginUser() async {
    if (storageIsNotNull("dataUser")) {
      var dataUser = GetStorage().read("dataUser");
      login(
        dataUser["EMAIL"].toString(),
        dataUser["PASSWORD"].toString(),
      );
      print(dataUser["NAME"].toString());
      print(dataUser["PHONE"].toString());
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
          loginController.listloginController[0].text = "";
          loginController.listloginController[1].text = "";
          loginController.update();
          isDataNotExist = "";
          update();
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
    profileController.initializeProfile();
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
