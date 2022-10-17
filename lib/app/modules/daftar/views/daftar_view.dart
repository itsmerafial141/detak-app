import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/values/strings.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  const DaftarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  _customSubTitle(),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .04),
                  _listTextField(textInputType, context),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .05),
                  _buttonDaftar(context),
                  CustomDivider(
                      height: MediaQuery.of(context).size.height * .04),
                  _loginText(),
                ],
              ).margin(
                  horizontal: MediaQuery.of(context).size.height * .03,
                  top: MediaQuery.of(context).size.height * .08);
            },
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: CustomFonts.montserratMedium10,
          children: [
            const TextSpan(text: "Sudah punya akun? "),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.back();
                },
              text: "Login",
              style: CustomFonts.montserratMedium10.copyWith(
                color: CustomColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonDaftar(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.daftar(context);
      },
      child: const Text("DAFTAR"),
    );
  }

  Widget _listTextField(
      List<TextInputType> textInputType, BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return _customTextField(
          hintText: CustomStrings.listTextField[index]['hint'].toString(),
          errorText: CustomStrings.listTextField[index]['error'].toString(),
          obscureText: index > 2 ? true : false,
          textInputType: textInputType[index],
          index: index,
        );
      },
      separatorBuilder: (_, __) {
        return CustomDivider(height: MediaQuery.of(context).size.height * .02);
      },
      itemCount: CustomStrings.listTextField.length,
    );
  }

  Widget _customSubTitle() {
    return CustomText(
      "Buat akun baru",
      style: CustomFonts.montserratSemibold12,
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
      inputFormatters: index == 0 || index == 2
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                  RegExp(index == 2 ? "[0-9]" : "[a-z A-Z]")),
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
