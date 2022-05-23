import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late List<TextEditingController> listloginController;
  late List<bool> listErrorController;
  late TextEditingController lupaPasswordEmailController;
  late bool lupaPasswordEmailErrorController = false;

  @override
  void onInit() {
    super.onInit();
    listloginController = [];
    listErrorController = [];
    for (int element = 0; element < 3; element++) {
      listloginController.add(TextEditingController());
      listErrorController.add(false);
    }

    lupaPasswordEmailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    listDispose();
  }

  void listDispose() {
    listloginController.clear();
    listErrorController.clear();
    lupaPasswordEmailController.dispose();
    lupaPasswordEmailErrorController = false;
  }

  void login() {
    listErrorController = [
      _emailIsError(),
      _passwordIsError(),
    ];
    if (!_allTextFieldIsNotEmpty() && _allTextFieldIsNotError()) {
      print("login");
      Get.offAllNamed(AppPages.HP);
    } else {
      print("error");
    }
    print(_allTextFieldIsNotEmpty());
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
    String pattern = r'^(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return !regExp.hasMatch(listloginController[1].text);
  }
}
