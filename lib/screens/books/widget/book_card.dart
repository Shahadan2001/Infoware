import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookCard extends StatelessWidget {
  final BookResponse bookResponse;
  const BookCard({super.key, required this.bookResponse});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
            )).expand(flex: 1),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookResponse.title,
              style: Constants.defaultTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              bookResponse.authors,
              style: Constants.defaultMiniTextStyle,
              overflow: TextOverflow.ellipsis,
            ).paddingOnly(
              top: 4.w,
            ),
          ],
        ).paddingOnly(top: 5.h),
      ],
    ).asButton(onTap: () {
      context.go('/books/book-details', extra: bookResponse);
      log('clicked');
    });
  }
}
