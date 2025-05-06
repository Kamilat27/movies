import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/app.dart';
// import 'package:final_project/app.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/pages/auth/registration_page.dart';
import 'package:final_project/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options:
    DefaultFirebaseOptions.currentPlatform);
  // Bloc.observer = SimpleBlocObserver();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );


}

