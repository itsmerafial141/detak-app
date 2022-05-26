// ignore_for_file: must_be_immutable

import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../controllers/profile_controller.dart';

class HasilTestDetailView extends StatelessWidget {
  var controllers = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Hasil Test",
            style: CustomFonts.montserratBold18.copyWith(
              color: CustomColors.subTittle,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: CustomColors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: percentageOfScreenWidth(100),
          height: percentageOfScreenHeight(100) -
              55 -
              Get.mediaQuery.viewPadding.top,
          child: Column(
            children: [
              SizedBox(
                width: percentageOfScreenWidth(100),
                height: percentageOfScreenHeight(2),
              ),
              SizedBox(
                width: percentageOfScreenWidth(80),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,
                  style: CustomFonts.montserratMedium14.copyWith(
                    color: CustomColors.subTittle,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(
                  percentageOfScreenWidth(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: Text("FINISH"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
