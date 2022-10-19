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
        _customDivider(height: MediaQuery.of(context).size.height * .2),
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03,
            ),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, __) {
              return Skelaton(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .5,
              );
            },
            separatorBuilder: (_, __) {
              return _customDivider(
                widht: 10,
              );
            },
            itemCount: 3,
          ),
        ),
        _customDivider(height: MediaQuery.of(context).size.height * .03),
        Skelaton(
          height: MediaQuery.of(context).size.height * .03,
          width: MediaQuery.of(context).size.width * .1,
        ).margin(horizontal: MediaQuery.of(context).size.width * .03),
        _customDivider(height: MediaQuery.of(context).size.height * .02),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, __) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .155,
              child: Row(
                children: [
                  Skelaton(
                    height: MediaQuery.of(context).size.height * .155,
                    width: MediaQuery.of(context).size.width * .25,
                  ),
                  _customDivider(
                      widht: MediaQuery.of(context).size.width * .01),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skelaton(
                          height: MediaQuery.of(context).size.height * .03,
                          width: double.infinity,
                        ),
                        _customDivider(
                            height: MediaQuery.of(context).size.height * .01),
                        Skelaton(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.height * .2,
                        ),
                        const Spacer(),
                        Skelaton(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.height * .1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).margin(horizontal: MediaQuery.of(context).size.height * .03);
          },
          separatorBuilder: (_, __) {
            return _customDivider(
                height: MediaQuery.of(context).size.height * .03);
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
