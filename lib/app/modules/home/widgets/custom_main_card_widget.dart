import 'package:detakapp/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/custom_exstension.dart';
import '../../../../core/theme/fonts.dart';
import '../../video/models/video_model.dart';

class CustomMainCardWidget extends StatelessWidget {
  const CustomMainCardWidget({
    Key? key,
    required this.index,
    required this.listData,
  }) : super(key: key);

  final int index;
  final List<VideoModel> listData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 45.sh,
          decoration: BoxDecoration(
            color: CustomColors.disable,
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                listData[index].image,
              ),
            ),
          ),
        ),
        Container(
          width: 45.sh,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Text(
            listData[index].title,
            style: CustomFonts.montserratBold12.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
