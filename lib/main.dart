import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_paper/firebase_options.dart';
import 'package:white_paper/layouts/cubit/cubit.dart';
import 'package:white_paper/layouts/home_layout.dart';
import 'package:white_paper/shared/network/remote/dio_helper.dart';

import 'modules/login_screen/login_screen.dart';
import 'modules/on_boarding_screen/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/components/constants.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      bool? isDark = CacheHelper.getData(key: 'isDark');
      Widget widget;

      bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
      uId = CacheHelper.getData(key: 'uId');

      print(token);
      if (onBoarding != null) {
        if (uId != null) {
          widget = const HomeScreen();
        } else {
          widget = LoginScreen();
        }
      } else {
        widget = OnBoardingScreen();
      }

      runApp(MyApp(
        isDark: isDark,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, AppState state) {},
        builder: (BuildContext context, AppState state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            // darkTheme: darkMode,
            // themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
