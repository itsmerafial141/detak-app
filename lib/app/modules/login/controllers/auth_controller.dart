// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:detakapp/app/modules/login/controllers/login_controller.dart';
import 'package:detakapp/app/modules/login/providers/login_provider.dart';
import 'package:detakapp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// danngriel@gmail.com
// tes123

class AuthController extends GetxController with StateMixin {
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
          // update();q
          change(null, status: RxStatus.success());
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

    isDataNotExist = "";
    profileController.initializeData();
    isAuth.value = true;
    loginController.listloginController[0].text = "";
    loginController.listloginController[1].text = "";
    isDataNotExist = "";
    change(null, status: RxStatus.success());
    log("delayed");
    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   loginController.update();
    //   update();
    // });
  }

  void logout() {
    if (storageIsNotNull("dataUser")) {
      GetStorage().erase();
      isAuth.value = false;
      // update();
      change(null, status: RxStatus.success());
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
