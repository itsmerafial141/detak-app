// ignore_for_file: must_be_immutable

import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:detakapp/core/values/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logoApp(context),
              CustomDivider(height: MediaQuery.of(context).size.height * .02),
              _titleText(context),
              CustomDivider(height: MediaQuery.of(context).size.height * .02),
              _emailTextField(),
              CustomDivider(height: MediaQuery.of(context).size.height * .02),
              _passwordTextField(),
              CustomDivider(height: MediaQuery.of(context).size.height * .02),
              // _lupaPasswordButton().align(alignment: Alignment.centerRight),
              // CustomDivider(height: MediaQuery.of(context).size.height * .02),
              _loginButton(context),
              CustomDivider(height: MediaQuery.of(context).size.height * .02),
              _daftarButton(),
            ],
          ).margin(horizontal: MediaQuery.of(context).size.height * .08),
        ),
      ),
    );
  }

  Widget _titleText(BuildContext context) {
    return Column(
      children: [
        CustomText(
          "Selamat Datang",
          style: CustomFonts.montserratBold24,
          color: CustomColors.primaryColor,
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .05),
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

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.onLoginTapped(context);
      },
      child: const Text("LOGIN"),
    );
  }

  // Widget _lupaPasswordButton() {
  //   return InkWell(
  //     onTap: () {
  //       // Get to lupa password page
  //       Get.to(LupaPasswordView());
  //     },
  //     child: Text(
  //       "Lupa Password?",
  //       style: CustomFonts.montserratSemibold10.copyWith(
  //         color: CustomColors.primaryColor.withOpacity(0.5),
  //       ),
  //     ),
  //   );
  // }

  Widget _passwordTextField() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return TextField(
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Password",
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
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        );
      },
    );
  }

  Widget _logoApp(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.width * .5,
      width: MediaQuery.of(context).size.width * .5,
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
