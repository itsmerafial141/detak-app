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
            _customDivider(height: 3.sh),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  controller.dataDetailBerita.data.nameCategory,
                  style: CustomFonts.montserratBold12,
                  color: CustomColors.grey,
                ),
                _customDivider(width: 1.sw),
                Icon(
                  Icons.circle,
                  size: 5,
                  color: CustomColors.grey,
                ),
                _customDivider(width: 1.sw),
                CustomText(
                  "${controller.getTimeDetailBerita(controller.dataDetailBerita.data.dateNews)} WIB",
                  style: CustomFonts.montserratSemibold12,
                  color: CustomColors.grey,
                ),
              ],
            ).margin(horizontal: 3.sh),
            _customDivider(height: 1.sh),
            CustomText(
              controller.dataDetailBerita.data.titleNews,
              style: CustomFonts.montserratBold14,
            ).margin(horizontal: 3.sh),
            _customDivider(height: 1.sh),
            CustomText(
              "oleh ${controller.dataDetailBerita.data.editor}",
              style: CustomFonts.montserratBold9,
              color: CustomColors.grey,
            ).margin(horizontal: 3.sh),
            _customDivider(height: 1.sh),
            Image(
              width: double.infinity,
              height: 30.sh,
              fit: BoxFit.cover,
              image: NetworkImage(
                "/images/news/${controller.dataDetailBerita.data.newsImage}"
                    .fromUrl,
              ),
            ),
            _customDivider(height: 2.sh),
            HtmlWidget(
              controller.dataDetailBerita.data.contentNews,
            ).margin(horizontal: 3.sh),
            _customDivider(height: 5.sh),
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
