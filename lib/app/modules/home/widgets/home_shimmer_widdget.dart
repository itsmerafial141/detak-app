import 'package:detakapp/core/utils/extensions/custom_exstension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/skelaton_widget.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _customDivider(height: 20.sh),
        SizedBox(
          height: 25.sh,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, __) {
              return _customDivider(widht: 3.sh);
            },
            separatorBuilder: (_, __) {
              return Skelaton(
                width: 40.sh,
              );
            },
            itemCount: 3,
          ),
        ),
        _customDivider(height: 3.sh),
        Skelaton(
          height: 3.sh,
          width: 10.sh,
        ).margin(horizontal: 3.sh),
        _customDivider(height: 2.sh),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) {
            return SizedBox(
              height: 15.5.sh,
              child: Row(
                children: [
                  Skelaton(
                    height: 15.5.sh,
                    width: 25.sh,
                  ),
                  _customDivider(widht: 1.sh),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skelaton(
                          height: 3.sh,
                          width: double.infinity,
                        ),
                        _customDivider(height: 1.sh),
                        Skelaton(
                          height: 3.sh,
                          width: 20.sh,
                        ),
                        const Spacer(),
                        Skelaton(
                          height: 3.sh,
                          width: 10.sh,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).margin(horizontal: 3.sh);
          },
          separatorBuilder: (_, __) {
            return _customDivider(height: 3.sh);
          },
          itemCount: 3,
        ),
      ],
    ).shimmer();
  }

  Widget _customDivider({double? height, double? widht}) {
    return SizedBox(
      height: height ?? 0,
      width: widht ?? 0,
    );
  }
}
