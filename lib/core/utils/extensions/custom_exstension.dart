// ignore_for_file: unnecessary_this

import 'package:detakapp/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  String formatedDate(String pattern) {
    var formatDate = DateFormat(pattern, "id_ID");
    return formatDate.format(DateTime.parse(this));
  }
}

extension WidgetExtension on Widget {
  Widget borderRadius({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    double? verticalTop,
    double? verticalBottom,
    double? horizontalLeft,
    double? horizontalRight,
    double? all,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          topLeft ?? verticalTop ?? horizontalLeft ?? all ?? 0,
        ),
        topRight: Radius.circular(
          topRight ?? verticalTop ?? horizontalRight ?? all ?? 0,
        ),
        bottomLeft: Radius.circular(
          bottomLeft ?? verticalBottom ?? horizontalLeft ?? all ?? 0,
        ),
        bottomRight: Radius.circular(
          bottomRight ?? verticalBottom ?? horizontalRight ?? all ?? 0,
        ),
      ),
      child: this,
    );
  }

  Widget margin({
    double? horizontal,
    double? vertical,
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? all,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
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

  Widget button(
      {required Function() onPressed,
      Color? backgroundColor,
      double? borderRadius,
      double? elevation}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation ?? 0),
          overlayColor: MaterialStateProperty.all(
            CustomColors.black.withOpacity(0.1),
          ),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? Colors.white),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
          ),
        ),
        child: this);
  }
}
