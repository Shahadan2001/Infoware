import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool isEnable;
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.isEnable});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: isEnable
              ? CustomColors.buttonRed
              : CustomColors.buttonRed.withOpacity(0.4),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r))),
      onPressed: isEnable ? onTap : null,
      child: Text(
        text,
        style:
            Constants.defaultTextStyle.copyWith(color: CustomColors.pureWhite),
      ).paddingAll(5.w),
    );
  }
}
