import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/screens/audio/widgets/audio_tile.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pureWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Music Library',
            style: Constants.titleTextStyle,
          ).paddingSymmetric(horizontal: 16.w, vertical: 4.w),
          AudioTile(audioName: 'Ve Haniya Dil Janiya-(DJMaza).mp3 ')
              .paddingOnly(top: 10.h),
        ],
      ).paddingOnly(top: 40.h),
    );
  }
}
