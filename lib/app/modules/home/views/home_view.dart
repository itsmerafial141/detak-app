// ignore_for_file: must_be_immutable

import 'package:detakapp/app/modules/video/controllers/video_controller.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_card_berita_widget.dart';
import '../widgets/custom_main_card_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: AppBar(
          backgroundColor: CustomColors.secondaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "DetakAppw",
            style: CustomFonts.montserratBold18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Stack main content with background
        child: Stack(
          children: [
            // Stack person ilustration with background
            _backgroundView(),
            _mainView(),
          ],
        ),
      ),
    );
  }

  Widget _mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _customDivider(height: 20.sh),
        _listMainBerita(),
        _customDivider(height: 3.sh),
        _customSubTitle(tittle: "Berita").wrapMargin(h: 3.sh),
        _customDivider(height: 3.sh),
        _listBerita().wrapMargin(h: 3.sh),
        _customDivider(height: 3.sh),
      ],
    );
  }

  Widget _listBerita() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return CustomCardBeritaWidget(
          index: index,
          listData: controller.listBerita,
        );
      },
      separatorBuilder: (_, __) {
        return SizedBox(
          height: 20,
        );
      },
      itemCount: controller.listBerita.length,
    );
  }

  Widget _customSubTitle({required String tittle}) {
    return Text(
      tittle,
      style: CustomFonts.montserratBold14,
    );
  }

  SizedBox _listMainBerita() {
    var listData = Get.put(VideoController()).listDataVideo;
    return SizedBox(
      height: percentageOfScreenHeight(25),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return SizedBox(
            width: 3.sh,
          );
        },
        separatorBuilder: (_, index) {
          return CustomMainCardWidget(
            index: index,
            listData: listData,
          );
        },
        itemCount: listData.length + 1,
      ),
    );
  }

  SizedBox _customDivider({double? height, double? widht}) {
    return SizedBox(
      height: height ?? 0,
      width: widht ?? 0,
    );
  }

  Widget _backgroundView() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Stack red background with wave background
        Stack(
          children: [
            SizedBox(
              height: 30.sh,
              width: 100.sw,
            ).backgroundColor(
              color: CustomColors.primaryColor,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage("assets/images/background image.png"),
              ),
            ),
          ],
        ),
        Image(
          height: 25.sh,
          image: AssetImage("assets/images/personBackground.png"),
        ),
      ],
    );
  }
}
