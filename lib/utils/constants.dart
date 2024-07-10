import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/utils/colors.dart';

class Constants {
  static TextStyle defaultTextStyle =
      TextStyle(color: CustomColors.pureBlack, fontSize: 16.sp);
  static TextStyle defaultMiniTextStyle =
      TextStyle(color: CustomColors.bgColor, fontSize: 13.sp);
  static TextStyle titleTextStyle = TextStyle(
      color: CustomColors.pureBlack,
      fontSize: 30.sp,
      fontWeight: FontWeight.w700);
  static TextStyle subTitleTextStyle = TextStyle(
      color: CustomColors.buttonRed,
      fontSize: 25.sp,
      fontWeight: FontWeight.w600);
}
