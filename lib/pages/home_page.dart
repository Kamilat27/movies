import 'package:final_project/bloc/auth/authentication_bloc/authentication_bloc.dart';
import 'package:final_project/bloc/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:final_project/shared_preferences/user_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/generated/locale_keys.g.dart';
import 'package:final_project/pages/animation.dart';
import 'package:final_project/pages/news.dart';
import 'package:final_project/pages/posts.dart';
import 'package:final_project/pages/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _titles = [
    LocaleKeys.news_page,
    LocaleKeys.posts_page,
    LocaleKeys.animation_page,
    LocaleKeys.profile_page,
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      NewsPage(),
      PostsPage(),
      AnimationPage(),
      ProfilePage(user: widget.user),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex], style: AppTextStyles.appBar,).tr(),
        backgroundColor: AppColors.appBarBackground,
        actions: [
          TextButton(
            child: Text("EN", style: AppTextStyles.appBar,),
            onPressed: () async {
              await context.setLocale(Locale('en'));
            },
          ),
          TextButton(
            child: Text("RU", style: AppTextStyles.appBar,),
            onPressed: () async {
              await context.setLocale(Locale('ru'));
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: AppColors.appBarBackground,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,

        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: LocaleKeys.news_page.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_outlined),
            label: LocaleKeys.posts_page.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: LocaleKeys.animation_page.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: LocaleKeys.profile_page.tr(),
          ),
        ],
      ),
    );
  }

}
