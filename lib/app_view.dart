import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/bloc/auth/authentication_bloc/authentication_bloc.dart';
import 'package:final_project/bloc/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/pages/auth/login_page.dart';
import 'package:final_project/pages/auth/registration_page.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange,
          unselectedItemColor: AppColors.appText,
          backgroundColor: AppColors.appBarBackground,
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen()
    );
  }
}
