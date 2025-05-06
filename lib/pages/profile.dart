import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/generated/locale_keys.g.dart';
import 'package:final_project/pages/auth/login_page.dart';
import 'package:final_project/shared_preferences/auth_service.dart';
import 'package:final_project/shared_preferences/user_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    User user = widget.user;
    void signOut(BuildContext context) async {
      await AuthService.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
    return Scaffold(
        backgroundColor: AppColors.bodyBackground,
        body:  Center(
          child: Column(
            children: [

              Container(

                width: MediaQuery.of(context).size.width, height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(
                            File(user.photoPath)),
                        fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))) , ),
              const SizedBox(height: 40),

              // Row
              Text('${user.name} ${user.lastName}', style: AppTextStyles.name),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                     Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: AppColors.icon, width: 1)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${LocaleKeys.phone_number_label.tr()}:", style: AppTextStyles.userInfo,),
                            Text(user.phoneNumber, style: AppTextStyles.userInfo,)
                          ],
                                             ),
                       ),
                     ),
                    SizedBox(height: 8,),
                    Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: AppColors.icon, width: 1)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("${LocaleKeys.email_label.tr()}:", style: AppTextStyles.userInfo,),
                             Container(width: 200, child: Text(user.email, style: AppTextStyles.userInfo, maxLines: 2,))
                           ],
                         ),
                       ),
                     ),
                  ],
                ),
              ),
              SizedBox(height: 130,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GestureDetector(
                  onTap: ()=> signOut(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Lottie.asset(
                        'assets/animations/logout.json',
                        height: 120,

                      ),
                      SizedBox(width: 0,),
                      Text(LocaleKeys.sign_out, style: AppTextStyles.labels,).tr(),

                    ],
                  ),
                ),
              )
            ],
          )

        )
    );
  }
}
