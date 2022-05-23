import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<DaftarController>(
            init: DaftarController(),
            builder: (_) {
              return Column(
                children: [
                  SizedBox(
                    height: Get.mediaQuery.viewPadding.top + 10,
                  ),
                  CustomAppBarWidget(
                    leadingOnPressed: () {
                      Get.back();
                    },
                    title: "Daftar Akun Baru",
                  ),
                  SizedBox(
                    height: percentageOfScreenHeight(5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.listController[0],
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Nama",
                            errorText: controller.listErrorController[0]
                                ? "Nama haris lebih dari 2 karakter."
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(2),
                        ),
                        TextField(
                          controller: controller.listController[1],
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Email",
                            errorText: controller.listErrorController[1]
                                ? "Email tidak sesuai. contoh : user@gmail.com"
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(2),
                        ),
                        TextField(
                          controller: controller.listController[2],
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "No. Handphone",
                            errorText: controller.listErrorController[2]
                                ? "No. Handphone tidak sesuai"
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(2),
                        ),
                        TextField(
                          controller: controller.listController[3],
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorMaxLines: 2,
                            errorText: controller.listErrorController[3]
                                ? "* Password harus lebih dari 7 karakter.\n* Password harus terdapat minimal satu digit."
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(2),
                        ),
                        TextField(
                          controller: controller.listController[4],
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Konfirm Password",
                            errorText: controller.listErrorController[4]
                                ? "Password tidak sesuai."
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(5),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Get.offAllNamed(AppPages.LG);
                            controller.daftar();
                          },
                          child: const Text("DAFTAR"),
                        ),
                        SizedBox(
                          height: percentageOfScreenHeight(1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun? ",
                              style: CustomFonts.montserratMedium10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAllNamed(AppPages.LG);
                              },
                              child: Text(
                                "Login",
                                style: CustomFonts.montserratMedium10.copyWith(
                                  color: CustomColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
