import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
  Widget paddingAll(value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(top: top, right: right, left: left, bottom: bottom),
        child: this,
      );
  Widget expand({required int flex}) => Expanded(
        flex: flex,
        child: this,
      );
  Widget wrapCenter() => Center(
        child: this,
      );
  Widget asButton({void Function()? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );
}
