import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/skelaton_widget.dart';

class DetailBeritaShimmerWidget extends StatelessWidget {
  const DetailBeritaShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skelaton(
          height: 2.sh,
          width: 18.sh,
        ),
        _customDivider(height: 1.sh),
        Skelaton(
          height: 2.sh,
          width: double.infinity,
        ),
        _customDivider(height: 1.sh),
        Skelaton(
          height: 2.sh,
          width: 10.sh,
        ),
        _customDivider(height: 1.sh),
        Skelaton(
          height: 30.sh,
          width: double.infinity,
        ),
        _customDivider(height: 1.sh),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skelaton(
                  height: 2.sh,
                  width: double.infinity,
                ),
                _customDivider(height: 1.sh),
                Skelaton(
                  height: 2.sh,
                  width: double.infinity,
                ),
                _customDivider(height: 1.sh),
                Skelaton(
                  height: 2.sh,
                  width: 20.sh,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) {
            return _customDivider(height: 1.sh);
          },
          itemCount: 5,
        ),
      ],
    ).margin(horizontal: 3.sh).shimmer();
  }

  Widget _customDivider({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
