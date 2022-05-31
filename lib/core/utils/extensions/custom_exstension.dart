// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

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
}
