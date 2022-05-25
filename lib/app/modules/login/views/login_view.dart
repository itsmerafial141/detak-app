import 'package:detakapp/app/modules/login/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'lupa_password_view.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: percentageOfScreenWidth(100),
        height: percentageOfScreenHeight(100),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 40,
              ),
              child: Column(
                children: [
                  // const Spacer(),
                  Image(
                    height: percentageOfScreenWidth(50),
                    width: percentageOfScreenWidth(50),
                    image: const AssetImage("assets/images/loginLogo.png"),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(2),
                  ),
                  Text(
                    "Selamat Datang",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(0.5),
                  ),
                  Text(
                    "Login untuk mengakses akun",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.subTittle,
                    ),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(2),
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (authController) {
                      return authController.isDataNotExist
                          ? Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: CustomColors.red,
                                ),
                                color: CustomColors.red.withOpacity(0.2),
                              ),
                              child: Text(
                                "Email atau Password anda salah!",
                                style: CustomFonts.montserratBold12.copyWith(
                                  color: CustomColors.red,
                                ),
                              ),
                            )
                          : SizedBox();
                    },
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(2),
                  ),
                  GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (_) {
                      return TextField(
                        controller: controller.listloginController[0],
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorText: controller.listErrorController[0]
                              ? "Email tidak valid."
                              : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(2),
                  ),
                  GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (_) {
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
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(1.5),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
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
                    ),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(2),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: const Text("LOGIN"),
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(1),
                  ),
                  Row(
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
