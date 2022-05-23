import 'package:detakapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarController extends GetxController {
  late List<TextEditingController> listController;
  late List<bool> listErrorController;

  var listCountController = 5;

  @override
  void onInit() {
    super.onInit();
    listController = [];
    listErrorController = [];
    for (int element = 0; element < listCountController; element++) {
      listController.add(TextEditingController());
      listErrorController.add(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    listController.clear();
  }

  void nameValidation() {
    if (listController[0].text.length >= 3) {
      listErrorController[0] = false;
    } else {
      listErrorController[0] = true;
    }
    update();
  }

  void daftar() {
    listErrorController = [
      nameIsError(),
      emailIsError(),
      phoneIsError(),
      passwordIsError(),
      konfirmPasswordIsError(),
    ];
    if (allTextFieldIsNotEmpty() && allTextFieldIsNotError()) {
      print("daftar");
      Get.offAllNamed(AppPages.LG);
    } else {
      print("error");
    }

    print("namaError : ${nameIsError()}");
    print("emailError : ${emailIsError()}");
    print("phoneError : ${phoneIsError()}");
    print("passwordError : ${passwordIsError()}");
    print("konformPasswordError : ${konfirmPasswordIsError()}");
    update();
  }

  bool allTextFieldIsNotEmpty() {
    return listController.indexWhere((element) => element.text.isEmpty) == -1;
  }

  bool allTextFieldIsNotError() {
    return listErrorController.indexWhere((element) => element == true) == -1;
  }

  bool nameIsError() {
    return listController[0].text.length <= 2;
  }

  bool emailIsError() {
    return !listController[1].text.isEmail;
  }

  bool phoneIsError() {
    return !listController[2].text.isPhoneNumber;
  }

  bool passwordIsError() {
    String pattern = r'^(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return !regExp.hasMatch(listController[3].text);
  }

  bool konfirmPasswordIsError() {
    return listController[4].text != listController[3].text;
  }
}
