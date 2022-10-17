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
          height: MediaQuery.of(context).size.height * .15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Skelaton(
                  height: MediaQuery.of(context).size.height * .15,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skelaton(
                      height: MediaQuery.of(context).size.height * .02,
                      width: double.infinity.sh,
                    ),
                    CustomDivider(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Skelaton(
                      height: MediaQuery.of(context).size.height * .02,
                      width: MediaQuery.of(context).size.width * .4,
                    ),
                    const Spacer(),
                    Skelaton(
                      height: MediaQuery.of(context).size.height * .01,
                      width: MediaQuery.of(context).size.height * .05,
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
          height: MediaQuery.of(context).size.height * .02,
        );
      },
      itemCount: 3,
    );
  }
}
