import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../core/theme/fonts.dart';
import '../controllers/test_controller.dart';

class PreparingTestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TestController());
    return YoutubePlayerControllerProvider(
      controller: controller.youtubePlayerController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "DetakApp",
            style: CustomFonts.montserratBold18.copyWith(
              color: CustomColors.subTittle,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              controller.youtubePlayerController.close();
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: CustomColors.subTittle,
            ),
          ),
        ),
        body: SizedBox(
          width: percentageOfScreenWidth(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: percentageOfScreenHeight(5),
              ),
              SizedBox(
                width: percentageOfScreenWidth(75),
                child: Text(
                  "Sebelum melakukan tes mandiri, tonton video tutorial berikut agar mempermudahmu dalam menjawab kuestioner!",
                  style: CustomFonts.montserratBold18,
                ),
              ),
              SizedBox(
                height: percentageOfScreenHeight(5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenWidth(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: controller.player,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenWidth(10),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Ambil tes sekarang"),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
