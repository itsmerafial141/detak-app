// ignore_for_file: unnecessary_this

import 'package:detakapp/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers.dart';

extension DoubleExtension on num {
  /// Mengembalikan nilai persentase dari lebar layar
  double get sw => percentageOfScreenWidth(this.toDouble());

  /// Mengembalikan nilai persentase dari tinggi layar
  double get sh => percentageOfScreenHeight(this.toDouble());
}

extension StringExtension on String {
  /// Mengembalikan nilai integer dari string
  int get toInt => int.parse(this);
  String get fromUrl => "https://detak.bgskr-project.my.id$this";
}

extension WidgetExtension on Widget {
  /// Membungkus widget dengan margin(Widget Padding) sesuai dengan nilai h(Horizontal) dan v(Vertical)
  Widget wrapMargin({double? v, double? h}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: v ?? 0,
        horizontal: h ?? 0,
      ),
      child: this,
    );
  }

  Widget backgroundColor({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.white,
      child: this,
    );
  }

  Widget align({AlignmentGeometry? alignment}) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: this,
    );
  }

  Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: CustomColors.disable,
      highlightColor: CustomColors.white,
      child: this,
    );
  }
}
