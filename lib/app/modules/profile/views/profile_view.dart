import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../core/utils/helpers.dart';
import '../../../../core/values/strings.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: percentageOfScreenWidth(10),
                vertical: percentageOfScreenWidth(5)),
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rafi Fitra Alamsyah",
                        style: CustomFonts.montserratBold14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "0813-3041-9185",
                        style: CustomFonts.montserratSemibold12.copyWith(
                          color: CustomColors.subTittle.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return index > 1
                  ? Divider(
                      height: 20,
                      color: CustomColors.grey,
                    )
                  : const SizedBox(
                      height: 20,
                    );
            },
            separatorBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: percentageOfScreenWidth(5),
                ),
                child: ListTile(
                  leading: Image(
                    height: 20,
                    width: 20,
                    color: CustomColors.primaryColor,
                    image: AssetImage(
                      CustomStrings.listProfileListTile[index][0],
                    ),
                  ),
                  title: Text(
                    CustomStrings.listProfileListTile[index][1],
                    style: CustomFonts.montserratSemibold12,
                  ),
                ),
              );
            },
            itemCount: CustomStrings.listProfileListTile.length + 1,
          ),
        ],
      ),
    );
  }
}
