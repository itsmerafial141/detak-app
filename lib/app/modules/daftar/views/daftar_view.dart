import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  const DaftarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listTextField = [
      {
        "hint": "Nama",
        "error": "* Nama harus lebih dari 2 karakter.",
      },
      {
        "hint": "Email",
        "error": "* Email tidak sesuai. contoh : user@gmail.com",
      },
      {
        "hint": "No. Handphone",
        "error": "* No. Handphone tidak sesuai",
      },
      {
        "hint": "Password",
        "error":
            "* Password harus lebih dari 7 karakter.\n* Password harus terdapat minimal satu digit.",
      },
      {
        "hint": "Konfirm Password",
        "error": "* Password tidak sesuai.",
      },
    ];
    List<TextInputType> textInputType = [
      TextInputType.name,
      TextInputType.emailAddress,
      TextInputType.phone,
      TextInputType.visiblePassword,
      TextInputType.visiblePassword,
    ];
    return Scaffold(
      appBar: CustomAppBar(
        colorBackground: Colors.white,
        textColor: CustomColors.primaryColor,
        label: "Daftar Akun Baru",
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomColors.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<DaftarController>(
            init: DaftarController(),
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Buat akun baru",
                    style: CustomFonts.montserratSemibold12,
                  ),
                  CustomDivider(height: 4.sh),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return _customTextField(
                        hintText: listTextField[index]['hint'].toString(),
                        errorText: listTextField[index]['error'].toString(),
                        obscureText: index > 2 ? true : false,
                        textInputType: textInputType[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return CustomDivider(height: 2.sh);
                    },
                    itemCount: listTextField.length,
                  ),
                  CustomDivider(height: 5.sh),
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
              ).margin(horizontal: 3.sh, top: 8.sh);
            },
          ),
        ),
      ),
    );
  }

  Widget _customTextField(
      {required String hintText,
      required String errorText,
      required int index,
      TextInputType? textInputType,
      bool? obscureText}) {
    return TextField(
      controller: controller.listController[index],
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: index == 0
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
            ]
          : null,
      textInputAction: TextInputAction.next,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: controller.listErrorController[index] ? errorText : null,
      ),
    );
  }
}
