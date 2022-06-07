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
      height: 25.sh,
      width: 100.sw,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return CustomDivider(width: 3.sh);
        },
        separatorBuilder: (_, index) {
          return Skelaton(
            height: 25.sh,
            width: 40.sh,
          );
        },
        itemCount: 3,
      ),
    ).shimmer();
  }
}
