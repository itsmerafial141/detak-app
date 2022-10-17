// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/custom_loading_dialog_widget.dart';
import '../../login/controllers/auth_controller.dart';
import '../providers/login_provider.dart';

class LoginController extends GetxController {
  var loginProvider = Get.put(LoginProvider());

  var keepAwakae = false;

  late List<TextEditingController> listloginController;
  late List<bool> listErrorController;
  late TextEditingController lupaPasswordEmailController;
  late bool lupaPasswordEmailErrorController = false;
  var authController = Get.put(AuthController());
  var isDataNotExist = "";

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    _autoLogin();
  }

  @override
  void dispose() {
    super.dispose();
    listDispose();
  }

  void _autoLogin() {
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

  void login(String email, String password) async {
    try {
      print("object");
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
          update();
        },
      ).whenComplete(
        () {
          Get.back();
          // update();q
          // change(null, status: RxStatus.success());
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
        "PROFILEPIC_USER": "",
        "PHONE": phone,
        "DATE_BIRTH": ""
      },
    );

    Get.offAllNamed(AppPages.NV);

    // profileController.initializeProfile();
    // isAuth.value = true;
    // change(null, status: RxStatus.success());
    // log("delayed");
    // Future.delayed(Duration(seconds: 1)).then((value) {
    //   loginController.update();
    //   update();
    // });
  }

  void _initializeData() {
    listloginController = [];
    listErrorController = [];
    for (int element = 0; element < 2; element++) {
      listloginController.add(TextEditingController());
      listErrorController.add(false);
    }
    lupaPasswordEmailController = TextEditingController();
  }

  void listDispose() {
    listloginController.clear();
    listErrorController.clear();
    lupaPasswordEmailController.dispose();
    lupaPasswordEmailErrorController = false;
  }

  void loginButton(BuildContext context) {
    listErrorController = [
      _emailIsError(),
      _passwordIsError(),
    ];
    if (_allTextFieldIsNotEmpty() && _allTextFieldIsNotError()) {
      CustomLoadingDialog.customLoadingDialog(context);
      print("login");
      login(
        listloginController[0].text, //emailController
        listloginController[1].text, //passwordController
      );
    } else {
      print("error");
    }
    print("emailError : ${_emailIsError()}");
    print("passwordError : ${_passwordIsError()}");
    update();
  }

  void lupaPassword() {
    lupaPasswordEmailErrorController = _lupaPassEmailIsError();
    if (!_lupaPassEmailIsError() &&
        lupaPasswordEmailController.text.isNotEmpty) {
      print("lupa password");
      Get.offAllNamed(AppPages.LG);
    } else {
      print("error");
    }
    print("emailError : ${_lupaPassEmailIsError()}");
    update();
  }

  bool storageIsNotNull(String key) {
    final box = GetStorage();
    return box.read(key) != null;
  }

  bool _allTextFieldIsNotEmpty() {
    return listloginController.indexWhere((element) => element.text.isEmpty) ==
        -1;
  }

  bool _allTextFieldIsNotError() {
    return listErrorController.indexWhere((element) => element == true) == -1;
  }

  bool _emailIsError() {
    return !listloginController[0].text.isEmail;
  }

  bool _lupaPassEmailIsError() {
    return !lupaPasswordEmailController.text.isEmail;
  }

  bool _passwordIsError() {
    String pattern = r'^(?=.*?[0-9]).{6,}$';
    RegExp regExp = RegExp(pattern);
    return !regExp.hasMatch(listloginController[1].text);
  }
}
