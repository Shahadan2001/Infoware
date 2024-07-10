import 'package:api_repository/api_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infoware_task/utils/colors.dart';
import 'package:infoware_task/utils/constants.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class BookScreen extends StatelessWidget {
  final BookResponse bookResponse;
  const BookScreen({super.key, required this.bookResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pureWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButton(onPressed: () => context.pop(context))
              .paddingOnly(top: 35.h),
          Container(
            height: 150.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: bookResponse.image,
                fit: BoxFit.cover,
              ),
            ),
          ).wrapCenter().paddingOnly(top: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${bookResponse.title}\n',
                style: Constants.defaultTextStyle,
              ).paddingOnly(top: 5.h),
              Text(
                'Subtitle: ${bookResponse.subtitle}\n',
                style: Constants.defaultTextStyle,
              ).paddingOnly(top: 5.h),
              Text(
                'Author: ${bookResponse.authors}\n',
                style: Constants.defaultTextStyle,
              ).paddingOnly(top: 5.h),
              Text(
                'Url: ${bookResponse.url}\n',
                style: Constants.defaultTextStyle,
              ).paddingOnly(top: 5.h),
            ],
          ).paddingSymmetric(vertical: 16.h)
        ],
      ).paddingSymmetric(horizontal: 16.w, vertical: 12.h),
    );
  }
}
