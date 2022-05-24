import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, __) {
              return const SizedBox(
                height: 20,
              );
            },
            separatorBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stackw(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: percentageOfScreenHeight(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/annie-spratt-zA7I5BtFbvw-unsplash.jpg",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "04:09",
                                style: CustomFonts.montserratSemibold9.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Penyebab Kanker Payudara | Yayasan Kanker Indonesia",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: CustomFonts.montserratBold12,
                  ),
                ],
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
