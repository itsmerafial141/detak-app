// ignore_for_file: use_key_in_widget_constructors

import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../controllers/home_controller.dart';

class DetailBeritaView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments["id"];
    var data = controller.getDataByID(arguments);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        title: Text(
          "DetakApp",
          style: CustomFonts.montserratBold18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.sh,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data[0].kategori,
                      style: CustomFonts.montserratSemibold12.copyWith(
                        color: CustomColors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.circle,
                      size: 5,
                      color: CustomColors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${data[0].waktu} AM",
                      style: CustomFonts.montserratSemibold12.copyWith(
                        color: CustomColors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.sh,
                ),
                Text(
                  data[0].title,
                  style: CustomFonts.montserratBold14.copyWith(
                    color: CustomColors.subTittle,
                  ),
                ),
                SizedBox(
                  height: 1.sh,
                ),
                Text(
                  "oleh ${data[0].penulis}",
                  style: CustomFonts.montserratBold9.copyWith(
                    color: CustomColors.grey,
                  ),
                ),
              ],
            ).wrapMargin(h: 3.sh),
            SizedBox(
              height: 1.sh,
            ),
            Image(
              width: double.infinity,
              height: 30.sh,
              fit: BoxFit.cover,
              image: NetworkImage(
                data[0].image,
              ),
            ),
            SizedBox(
              height: 2.sh,
            ),
            Text(
              data[0].content,
              style: CustomFonts.montserratRegular11.copyWith(
                color: CustomColors.grey,
              ),
            ).wrapMargin(h: 3.sh),
            SizedBox(
              height: 5.sh,
            ),
          ],
        ),
      ),
    );
  }
}
