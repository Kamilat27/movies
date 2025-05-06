import 'dart:async';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/pages/auth/login_page.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/shared_preferences/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(Duration(seconds: 1));

    final user = await AuthService.getCurrentUser();

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => user != null ? HomePage(user: user) : LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyBackground,
      body: SizedBox.expand( // Makes Lottie cover full screen
        child: Lottie.asset(
          'assets/animations/curtains.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
