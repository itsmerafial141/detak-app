import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../controllers/home_controller.dart';
import '../models/berita_model.dart';
import '../views/detail_berita_view.dart';

class CustomCardBeritaWidget extends GetView<HomeController> {
  const CustomCardBeritaWidget({
    Key? key,
    required this.index,
    required this.listData,
  }) : super(key: key);

  final int index;
  final List<BeritaModel> listData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailBeritaView(), arguments: {"id": listData[index].id});
        // controller.getDataByID(listData[index].id);
      },
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: 15.sh,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: 35.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      listData[index].image,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listData[index].title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: CustomFonts.montserratBold12,
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        style: CustomFonts.montserratSemibold9.copyWith(
                          color: CustomColors.darkGray,
                        ),
                        children: [
                          TextSpan(
                            text: "Oleh ",
                          ),
                          TextSpan(
                              style: CustomFonts.montserratBold9,
                              text: listData[index].penulis),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
