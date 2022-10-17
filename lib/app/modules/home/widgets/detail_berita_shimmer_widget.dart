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
          height: MediaQuery.of(context).size.height * .02,
          width: MediaQuery.of(context).size.height * .18,
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .01),
        Skelaton(
          height: MediaQuery.of(context).size.height * .02,
          width: double.infinity,
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .01),
        Skelaton(
          height: MediaQuery.of(context).size.height * .02,
          width: MediaQuery.of(context).size.height * .1,
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .01),
        Skelaton(
          height: MediaQuery.of(context).size.height * .3,
          width: double.infinity,
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .01),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skelaton(
                  height: MediaQuery.of(context).size.height * .02,
                  width: double.infinity,
                ),
                _customDivider(
                    height: MediaQuery.of(context).size.height * .01),
                Skelaton(
                  height: MediaQuery.of(context).size.height * .02,
                  width: double.infinity,
                ),
                _customDivider(
                    height: MediaQuery.of(context).size.height * .01),
                Skelaton(
                  height: MediaQuery.of(context).size.height * .02,
                  width: MediaQuery.of(context).size.height * .2,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) {
            return _customDivider(
                height: MediaQuery.of(context).size.height * .01);
          },
          itemCount: 5,
        ),
      ],
    ).margin(horizontal: MediaQuery.of(context).size.height * .03).shimmer();
  }

  Widget _customDivider({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
