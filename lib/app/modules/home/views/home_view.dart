import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../controllers/home_controller.dart';
import 'detail_berita_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Stack(
                children: [
                  ColoredBox(
                    color: CustomColors.primaryColor,
                    child: SizedBox(
                      height: percentageOfScreenHeight(30),
                      width: percentageOfScreenWidth(100),
                    ),
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
                height: percentageOfScreenHeight(25),
                image: AssetImage("assets/images/personBackground.png"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: percentageOfScreenHeight(20),
              ),
              SizedBox(
                height: percentageOfScreenHeight(25),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: percentageOfScreenWidth(70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/annie-spratt-zA7I5BtFbvw-unsplash.jpg",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: percentageOfScreenWidth(70),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                          ),
                          child: Text(
                            "Penyebab Kanker Payudara | Yayasan Kanker Indonesia",
                            style: CustomFonts.montserratBold12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: percentageOfScreenHeight(3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berita",
                      style: CustomFonts.montserratBold14,
                    ),
                    SizedBox(
                      height: percentageOfScreenHeight(3),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(DetailBeritaView());
                          },
                          borderRadius: BorderRadius.circular(14),
                          child: SizedBox(
                            height: percentageOfScreenHeight(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: percentageOfScreenWidth(35),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/annie-spratt-zA7I5BtFbvw-unsplash.jpg",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kenali, 8 Gejala Kanker Payudara Pada Wanita, Salah Satunya Nyeri",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: CustomFonts.montserratBold12,
                                        ),
                                        Spacer(),
                                        RichText(
                                          text: TextSpan(
                                            style: CustomFonts
                                                .montserratSemibold9
                                                .copyWith(
                                              color: CustomColors.darkGray,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "Oleh ",
                                              ),
                                              TextSpan(
                                                style:
                                                    CustomFonts.montserratBold9,
                                                text: "Rafi Fitra Alamsyah",
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
                      },
                      separatorBuilder: (_, __) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
