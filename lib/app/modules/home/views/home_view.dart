// ignore_for_file: must_be_immutable

import 'package:detakapp/app/modules/home/widgets/home_shimmer_widdget.dart';
import 'package:detakapp/app/modules/video/controllers/video_controller.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_card_berita_widget.dart';
import '../widgets/custom_main_card_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  var controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        colorBackground: CustomColors.secondaryColor,
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
    List<Widget> listMainView = [
      _listMainBerita().margin(top: 20.sh),
      _customSubTitle(tittle: "Berita").margin(horizontal: 3.sh),
      _listBerita().margin(horizontal: 3.sh),
    ];
    return controller.obx(
      (_) => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return listMainView[index];
        },
        separatorBuilder: (_, __) {
          return CustomDivider(height: 3.sh);
        },
        itemCount: listMainView.length,
      ),
      onLoading: const HomeShimmer(),
    );
  }

  Widget _listBerita() {
    return controller.obx(
      (_) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return CustomCardBeritaWidget(
              index: index,
              listData: controller.listBerita,
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: controller.listBerita[0].data.length,
        );
      },
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _customSubTitle({required String tittle}) {
    return Text(
      tittle,
      style: CustomFonts.montserratBold14,
    );
  }

  Widget _listMainBerita() {
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
            const Align(
              alignment: Alignment.topCenter,
              child: Image(
                image: AssetImage("assets/images/background image.png"),
              ),
            ),
          ],
        ),
        Image(
          height: 25.sh,
          image: const AssetImage("assets/images/personBackground.png"),
        ),
      ],
    );
  }
}
