import 'package:api_repository/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:infoware_task/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:infoware_task/screens/audio/audio_screen.dart';
import 'package:infoware_task/screens/book/book_screen.dart';
import 'package:infoware_task/screens/books/books_screen.dart';
import 'package:infoware_task/screens/sign_in/sign_in.dart';

final shellKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  initialLocation: '/sign-in',
  routes: [
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    ShellRoute(
      navigatorKey: shellKey,
      builder: (context, state, child) => CustomBottomNavigationBar(
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: shellKey,
          path: '/books',
          builder: (context, state) => const BooksScreen(),
          routes: [
            GoRoute(
              parentNavigatorKey: shellKey,
              path: 'book-details',
              builder: (context, state) {
                BookResponse bookResponse = state.extra as BookResponse;
                print('hello');
                return BookScreen(bookResponse: bookResponse);
              },
            )
          ],
        ),
        GoRoute(
          parentNavigatorKey: shellKey,
          path: '/my-music',
          builder: (context, state) => const AudioScreen(),
        )
      ],
    ),
  ],
);
