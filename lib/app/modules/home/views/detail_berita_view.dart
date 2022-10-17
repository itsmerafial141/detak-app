// ignore_for_file: use_key_in_widget_constructors

import 'package:detakapp/app/widgets/custom_text_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../controllers/home_controller.dart';

class DetailBeritaView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customDivider(height: MediaQuery.of(context).size.height * .03),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  controller.dataDetailBerita.data.nameCategory,
                  style: CustomFonts.montserratBold12,
                  color: CustomColors.grey,
                ),
                _customDivider(width: MediaQuery.of(context).size.width * .01),
                Icon(
                  Icons.circle,
                  size: 5,
                  color: CustomColors.grey,
                ),
                _customDivider(width: MediaQuery.of(context).size.width * .01),
                CustomText(
                  "${controller.getTimeDetailBerita(controller.dataDetailBerita.data.dateNews)} WIB",
                  style: CustomFonts.montserratSemibold12,
                  color: CustomColors.grey,
                ),
              ],
            ).margin(horizontal: MediaQuery.of(context).size.height * .03),
            _customDivider(height: MediaQuery.of(context).size.height * .01),
            CustomText(
              controller.dataDetailBerita.data.titleNews,
              style: CustomFonts.montserratBold14,
            ).margin(horizontal: MediaQuery.of(context).size.height * .03),
            _customDivider(height: MediaQuery.of(context).size.height * .01),
            CustomText(
              "oleh ${controller.dataDetailBerita.data.editor}",
              style: CustomFonts.montserratBold9,
              color: CustomColors.grey,
            ).margin(horizontal: MediaQuery.of(context).size.height * .03),
            _customDivider(height: MediaQuery.of(context).size.height * .01),
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              fit: BoxFit.cover,
              image: NetworkImage(
                "/images/news/${controller.dataDetailBerita.data.newsImage}"
                    .fromUrl,
              ),
            ),
            _customDivider(height: MediaQuery.of(context).size.height * .02),
            HtmlWidget(
              controller.dataDetailBerita.data.contentNews,
            ).margin(horizontal: MediaQuery.of(context).size.height * .03),
            _customDivider(height: MediaQuery.of(context).size.height * .05),
          ],
        ),
      ),
    );
  }

  Widget _customDivider({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: CustomColors.primaryColor,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: CustomColors.white,
        ),
      ),
      title: CustomText(
        "DetakApp",
        style: CustomFonts.montserratBold18,
        color: CustomColors.white,
      ),
    );
  }
}
