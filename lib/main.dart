import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'config/theme/app_theme.dart';
import 'core/api/dio_helper.dart';
import 'core/utils/cache_helper.dart';
import 'features/auth/cubit/auth_cubit/auth_cubit.dart';
import 'features/checklist/cubit/check_list_cubit/check_list_cubit.dart';
import 'features/splash/splash_screen.dart';
import 'features/tabbar_main/tab_cubit/tab_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper.init();
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( designSize: const Size(360, 730),
      useInheritedMediaQuery: true,
      child:MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(create: (context) => CheckListCubit()),
          BlocProvider(create: (context) => AuthCubit()),



        ],

        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeMangerApp(),
          debugShowCheckedModeBanner: false,navigatorKey: navigatorKey,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
