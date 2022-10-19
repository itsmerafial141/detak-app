import 'dart:developer';

import 'package:detakapp/app/widgets/my_raw_snackbar.dart';
import 'package:detakapp/core/values/keys/response_code_key.dart';
import 'package:detakapp/core/values/strings.dart';
import 'package:detakapp/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/custom_loading_dialog_widget.dart';
import '../../../data/providers/login_provider.dart';

class LoginController extends GetxController {
  LoginProvider loginProvider = Get.put(LoginProvider());
  StorageService storageService = Get.put(StorageService());

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController lupaPasswordEmailController;
  late bool lupaPasswordEmailErrorController = false;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
    listDispose();
  }

  void _initializeData() {
    _initializeController();
  }

  void _initializeController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lupaPasswordEmailController = TextEditingController();
  }

  void onLoginTapped(BuildContext context) async {
    CustomLoadingDialog.customLoadingDialog(context);
    try {
      loginProvider
          .login(emailController.text, passwordController.text)
          .then((value) {
        _saveToStorage(
          email: value.data.email,
          name: value.data.name,
          nameRole: value.data.nameRole,
          phone: value.data.phone,
          password: passwordController.text,
        );
        Get.offAllNamed(AppPages.NV);
        MyRawSnackBar.rawSanckBar(
          statusCode: RespCode.success,
          message: MyError.loginSuccess,
        );
        log("success");
      }).onError((error, stackTrace) {
        Get.back();
        MyRawSnackBar.rawSanckBar(
          statusCode: RespCode.error,
          message: error.toString(),
        );
        stackTrace.printError();
        error.printError();
        log("login error!");
      });
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
    storageService.write(
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
  }

  void listDispose() {
    emailController.dispose();
    passwordController.dispose();
    lupaPasswordEmailController.dispose();
    lupaPasswordEmailErrorController = false;
  }
}
