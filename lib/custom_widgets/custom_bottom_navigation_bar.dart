import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infoware_task/cubits/navigation_cubit.dart';
import 'package:infoware_task/screens/audio/audio_screen.dart';
import 'package:infoware_task/screens/books/books_screen.dart';
import 'package:infoware_task/screens/sign_in/sign_in.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:infoware_task/utils/widget__extrensions/widget_extension.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Widget child;
  const CustomBottomNavigationBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const BooksScreen(), const AudioScreen()];
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, index) {
          return Scaffold(
              body: child,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: BottomNavigationBar(
                  selectedItemColor: CustomColors.pureWhite,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: CustomColors.bgColor,
                  unselectedItemColor: CustomColors.pureWhite.withOpacity(0.4),
                  currentIndex: index,
                  elevation: 0,
                  onTap: (value) {
                    router.go(getLocation(value));
                    context.read<NavigationCubit>().onChanged(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'Books',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.my_library_music), label: 'My music'),
                  ],
                ),
              ).paddingSymmetric(horizontal: 10.w, vertical: 8.h));
        },
      ),
    );
  }

  String getLocation(index) {
    switch (index) {
      case 0:
        return '/books';
      case 1:
        return '/my-music';
    }
    return '';
  }
}
