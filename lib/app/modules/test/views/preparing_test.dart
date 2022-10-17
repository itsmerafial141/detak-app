// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:chewie/chewie.dart';
import 'package:detakapp/app/routes/app_pages.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/app/widgets/skelaton_widget.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:detakapp/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../core/theme/fonts.dart';
import '../controllers/test_controller.dart';

class PreparingTestView extends GetView<TestController> {
  const PreparingTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TestController());
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        controller.chewieController!.pause();
        controller.chewieController!.seekTo(
          const Duration(milliseconds: 0),
        );
        return true;
      },
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
              controller.chewieController!.pause();
              controller.chewieController!.seekTo(
                const Duration(milliseconds: 0),
              );
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: CustomColors.subTittle,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
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
                  child: GetBuilder<TestController>(
                    init: TestController(),
                    builder: (controller) => controller.chewieController !=
                                null &&
                            controller.chewieController!.videoPlayerController
                                .value.isInitialized
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .3,
                              width: double.infinity,
                              child: Chewie(
                                controller: controller.chewieController!,
                              ),
                            ).backgroundColor(color: Colors.black),
                          )
                        : Skelaton(
                            height: MediaQuery.of(context).size.height * .3,
                            width: double.infinity,
                          ).shimmer(),
                  ),
                ),
                CustomDivider(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: percentageOfScreenWidth(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.chewieController!.pause();
                      controller.chewieController!.seekTo(
                        const Duration(milliseconds: 0),
                      );

                      Get.toNamed(AppPages.KS);
                    },
                    child: const Text("Ambil tes sekarang"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
