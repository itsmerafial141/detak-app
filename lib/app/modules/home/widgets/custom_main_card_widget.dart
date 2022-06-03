import 'package:detakapp/app/modules/home/controllers/home_controller.dart';
import 'package:detakapp/app/modules/home/models/berita_slider_model.dart';
import 'package:detakapp/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/extensions/custom_exstension.dart';
import '../../../../core/theme/fonts.dart';

class CustomMainCardWidget extends GetView<HomeController> {
  const CustomMainCardWidget({
    Key? key,
    required this.index,
    required this.listData,
  }) : super(key: key);

  final int index;
  final BeritaSliderModel listData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.detailBerita(listData.data[index].idNews);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 40.sh,
            decoration: BoxDecoration(
              color: CustomColors.disable,
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "/images/news/${listData.data[index].newsImage[0]}".fromUrl,
                ),
              ),
            ),
          ),
          Container(
            width: 40.sh,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Text(
              listData.data[index].titleNews.toString(),
              style: CustomFonts.montserratBold12.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
