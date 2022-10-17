// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:detakapp/app/modules/home/widgets/home_shimmer_widdget.dart';
import 'package:detakapp/app/widgets/custom_divider_widget.dart';
import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_card_berita_widget.dart';
import '../widgets/custom_main_card_widget.dart';

class HomeView extends GetView<HomeController> {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  var controller = Get.put(HomeController());

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
            _backgroundView(context),
            _mainView(context),
          ],
        ),
      ),
    );
  }

  Widget _mainView(BuildContext context) {
    return controller.obx(
        (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(height:MediaQuery.of(context).size.height * .1),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  height:MediaQuery.of(context).size.height * .1,
                  child: AutoSizeText(
                    "Halo, ${controller.nameUser}!",
                    maxLines: 2,
                    softWrap: true,
                    style: CustomFonts.montserratBold24.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ).margin(left: MediaQuery.of(context).size.height * .03),
                CustomDivider(height: MediaQuery.of(context).size.height * .05),
                _listMainBerita(context),
                CustomDivider(height: MediaQuery.of(context).size.height * .03),
                _customSubTitle(tittle: "Berita").margin(
                    horizontal: MediaQuery.of(context).size.height * .03),
                CustomDivider(height: MediaQuery.of(context).size.height * .03),
                _listBerita(context)
                    .margin(
                        horizontal: MediaQuery.of(context).size.height * .03)
                    .margin(bottom: MediaQuery.of(context).size.height * .03),
              ],
            ),
        onLoading: const HomeShimmer());
  }

  Widget _listBerita(BuildContext context) {
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
        return CustomDivider(
          height: MediaQuery.of(context).size.height * .02,
        );
      },
      itemCount: controller.listBerita[0].data.length,
    );
  }

  Widget _customSubTitle({required String tittle}) {
    return Text(
      tittle,
      style: CustomFonts.montserratBold14,
    );
  }

  Widget _listMainBerita(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return CustomDivider(width: MediaQuery.of(context).size.height * .03);
        },
        separatorBuilder: (_, index) {
          return Stack(
            children: [
              CustomMainCardWidget(
                index: index,
                listData: controller.dataBeritaSlide,
              ),
            ],
          );
        },
        itemCount: controller.dataBeritaSlide.data.length + 1,
      ),
    );
  }

  Widget _backgroundView(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Stack red background with wave background
        Stack(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
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
        SvgPicture.asset(
          height: MediaQuery.of(context).size.height * .25,
          "assets/images/homeImageBackground.svg",
          alignment: Alignment.topRight,
        ),
      ],
    );
  }
}
