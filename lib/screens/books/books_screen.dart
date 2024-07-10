import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:infoware_task/cubits/books/books_cubit.dart';
import 'package:infoware_task/screens/books/widget/book_card.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';
import 'package:user_repository/user_repository.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(context.read<UserRepository>()),
      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: CustomColors.pureWhite,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Seller',
                        style: Constants.titleTextStyle,
                      ).paddingSymmetric(horizontal: 16.w, vertical: 4.w),
                      if (state.status != FormzSubmissionStatus.inProgress)
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.w,
                            childAspectRatio: 1 / 1.7,
                          ),
                          padding: EdgeInsets.only(
                              left: 16.w, bottom: 16.w, right: 16.w),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              BookCard(bookResponse: state.bookResponse[index]),
                          itemCount: state.bookResponse.length,
                        ).paddingOnly(bottom: 50.h)
                      else
                        const CircularProgressIndicator(
                          color: CustomColors.cardBg,
                        ).paddingOnly(top: 60.w).wrapCenter(),
                    ],
                  ),
                ).expand(flex: 1),
              ],
            ).paddingOnly(
              top: 40.w,
            ),
          );
        },
      ),
    );
  }
}
