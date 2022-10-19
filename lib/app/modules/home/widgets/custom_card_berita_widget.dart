import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/berita_model.dart';

class CustomCardBeritaWidget extends GetView<HomeController> {
  const CustomCardBeritaWidget({
    Key? key,
    required this.index,
    required this.listData,
  }) : super(key: key);

  final int index;
  final BeritaModel listData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.detailBerita(listData.data[index].idNews, context);
      },
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.height * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: CustomColors.disable,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "/images/news/${listData.data[index].newsImage}".fromUrl,
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
                      listData.data[index].titleNews,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: CustomFonts.montserratBold12,
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        style: CustomFonts.montserratSemibold9.copyWith(
                          color: CustomColors.darkGray,
                        ),
                        children: [
                          const TextSpan(
                            text: "Oleh ",
                          ),
                          TextSpan(
                            style: CustomFonts.montserratBold9,
                            text: listData.data[index].editor,
                          ),
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
