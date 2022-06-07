import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_divider_widget.dart';
import '../../../widgets/skelaton_widget.dart';

class BeritaShimmerWidget extends StatelessWidget {
  const BeritaShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return SizedBox(
          height: 15.sh,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Skelaton(
                  height: 15.sh,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skelaton(
                      height: 2.sh,
                      width: double.infinity.sh,
                    ),
                    CustomDivider(
                      height: 1.sh,
                    ),
                    Skelaton(
                      height: 2.sh,
                      width: 40.sw,
                    ),
                    const Spacer(),
                    Skelaton(
                      height: 1.sh,
                      width: 5.sh,
                    ),
                  ],
                ).margin(all: 10),
              ),
            ],
          ),
        ).shimmer();
      },
      separatorBuilder: (_, __) {
        return CustomDivider(
          height: 2.sh,
        );
      },
      itemCount: 3,
    );
  }
}
