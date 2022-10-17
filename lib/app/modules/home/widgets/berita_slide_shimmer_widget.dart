import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_divider_widget.dart';
import '../../../widgets/skelaton_widget.dart';

class BeritaSlideShimmerWidget extends StatelessWidget {
  const BeritaSlideShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return CustomDivider(width: MediaQuery.of(context).size.height * .03);
        },
        separatorBuilder: (_, index) {
          return Skelaton(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.height * .4,
          );
        },
        itemCount: 3,
      ),
    ).shimmer();
  }
}
