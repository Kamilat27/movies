import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bodyBackground,
      body:  Center(

        child: Lottie.asset('assets/animations/naruto.json'),
      )
    );
  }
}
