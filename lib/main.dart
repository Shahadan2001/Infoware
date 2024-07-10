import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoware_task/utils/utils.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  ApiClient apiClient = ApiClient();
  runApp(MyApp(
    userRepository: UserRepository(apiClient),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => userRepository,
      child: ScreenUtilInit(
        designSize: const Size(365, 677),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Infoware Task',
          routerConfig: router,
        ),
      ),
    );
  }
}
