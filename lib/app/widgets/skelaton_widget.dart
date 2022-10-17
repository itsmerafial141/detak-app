import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class Skelaton extends StatelessWidget {
  const Skelaton({
    Key? key,
    this.height,
    this.width,
    this.borderRaddius,
    this.color,
  }) : super(key: key);
  final double? height;
  final double? width;
  final BorderRadius? borderRaddius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRaddius ??
          BorderRadius.circular(MediaQuery.of(context).size.height * .01),
      child: ColoredBox(
        color: color ?? CustomColors.disable,
        child: SizedBox(
          height: height ?? 0,
          width: width ?? 0,
        ),
      ),
    );
  }
}
