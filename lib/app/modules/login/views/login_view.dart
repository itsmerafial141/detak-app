// ignore_for_file: must_be_immutable

import 'package:detakapp/app/modules/login/controllers/auth_controller.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:detakapp/core/values/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'lupa_password_view.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      _logoApp(),
      _titleText(),
      _errorMessage(),
      _emailTextField(),
      _passwordTextField(),
      _lupaPasswordButton().align(alignment: Alignment.centerRight),
      _loginButton(),
      _daftarButton(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 100.sw,
        height: 100.sh,
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return listWidget[index].margin(horizontal: 8.sh);
            },
            separatorBuilder: (_, __) {
              return _customDivider(height: 2.sh);
            },
            itemCount: listWidget.length,
          ),
        ).align(
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _titleText() {
    return Column(
      children: [
        CustomText(
          "Selamat Datang",
          style: CustomFonts.montserratBold24,
          color: CustomColors.primaryColor,
        ),
        _customDivider(height: 0.5.sh),
        CustomText(
          "Login untuk mengakses akun",
          style: CustomFonts.montserratMedium12,
          color: CustomColors.subTittle,
        ),
      ],
    );
  }

  Widget _daftarButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tidak punya akun? ",
          style: CustomFonts.montserratSemibold10,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppPages.DF);
          },
          child: Text(
            "Daftar",
            style: CustomFonts.montserratSemibold10.copyWith(
              color: CustomColors.primaryColor.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }

  Widget _loginButton() {
    var controller = Get.put(LoginController());
    return ElevatedButton(
      onPressed: () {
        controller.login();
      },
      child: const Text("LOGIN"),
    );
  }

  Widget _lupaPasswordButton() {
    return InkWell(
      onTap: () {
        // Get to lupa password page
        Get.to(LupaPasswordView());
      },
      child: Text(
        "Lupa Password?",
        style: CustomFonts.montserratSemibold10.copyWith(
          color: CustomColors.primaryColor.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return TextField(
          controller: controller.listloginController[1],
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            errorText: controller.listErrorController[1]
                ? "Password tidak valid."
                : null,
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return TextField(
          controller: controller.listloginController[0],
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Email",
            errorText:
                controller.listErrorController[0] ? "Email tidak valid." : null,
          ),
        );
      },
    );
  }

  Widget _errorMessage() {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) {
        return authController.isDataNotExist != "" ||
                authController.isDataNotExist.isNotEmpty
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: CustomColors.red,
                  ),
                  color: CustomColors.red.withOpacity(0.2),
                ),
                child: CustomText(
                  authController.isDataNotExist,
                  style: CustomFonts.montserratBold12,
                  color: CustomColors.red,
                ),
              )
            : const SizedBox();
      },
    );
  }

  Widget _logoApp() {
    return Image(
      height: 50.sw,
      width: 50.sw,
      image: const AssetImage(CustomStrings.logoApp),
    );
  }

  Widget _customDivider({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
