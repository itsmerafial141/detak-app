// ignore_for_file: avoid_log

import 'dart:developer';

import 'package:detakapp/app/modules/daftar/providers/daftar_provider.dart';
import 'package:detakapp/app/widgets/custom_loading_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarController extends GetxController {
  var daftarProvider = Get.put(DaftarProvider());

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
      log("daftar");
      CustomLoadingDialog.customLoadingDialog();
      _daftarProcess(
        nama: listController[0].text,
        email: listController[1].text,
        phone: listController[2].text,
        password: listController[4].text,
      );
    } else {
      log("error");
    }
    update();
  }

  void _daftarProcess({
    required String nama,
    required String email,
    required String phone,
    required String password,
  }) {
    try {
      daftarProvider
          .daftar(
        nama,
        email,
        phone,
        password,
      )
          .then(
        (value) {
          log("sucess");
          log(value.message);
          Get.back();
        },
      ).onError(
        (error, stackTrace) {
          log("onError");
          error.printError();
        },
      ).whenComplete(
        () {
          log("whenComplete");
          Get.back();
        },
      );
    } catch (err) {
      err.printError();
    }
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
