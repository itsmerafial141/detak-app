// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/login_controller.dart';

class LupaPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.mediaQuery.viewPadding.top + 10,
              ),
              CustomAppBarWidget(
                leadingOnPressed: () {
                  controller.lupaPasswordEmailController.clear();
                  controller.lupaPasswordEmailErrorController = false;
                  Get.back();
                },
                title: "Lupa Password",
              ),
              SizedBox(
                height: percentageOfScreenHeight(5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Password",
                      style: CustomFonts.montserratSemibold12,
                    ),
                    SizedBox(
                      height: percentageOfScreenHeight(2),
                    ),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (_) {
                        return TextField(
                          controller: controller.lupaPasswordEmailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Email",
                            errorText:
                                controller.lupaPasswordEmailErrorController
                                    ? "Email tidak valid."
                                    : null,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: percentageOfScreenHeight(5),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.lupaPassword();
                      },
                      child: const Text("KIRIM"),
                    ),
                    SizedBox(
                      height: percentageOfScreenHeight(2),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Link reset password akan dikirimkan melalui email anda",
                        textAlign: TextAlign.center,
                        style: CustomFonts.montserratRegular12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
