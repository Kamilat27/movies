import 'package:final_project/constants/app_colors.dart';
import 'package:flutter/material.dart';


class AppTextStyles{
  static final TextStyle appBar = TextStyle(
    // fontFamily: 'SP',
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.appText,
  );

  static final TextStyle title = TextStyle(
    // fontFamily: 'SP',
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppColors.appText,
    height: 1.1
  );
  static final TextStyle userInfo = TextStyle(
    // fontFamily: 'SP',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: AppColors.appText,
    height: 1.1
  );
  static final TextStyle name = TextStyle(
    // fontFamily: 'SP',
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppColors.icon,
    height: 1.1
  );

  static final TextStyle subtitle = TextStyle(
    // fontFamily: 'SP',
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: AppColors.appText,
  );

  static final TextStyle plotDescription = TextStyle(
    // fontFamily: 'SP',
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: AppColors.plotText,
    height: 1.2
  );
  static final TextStyle genres = TextStyle(
    // fontFamily: 'SP',
    fontSize: 11,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColors.appText,
    height: 1.2
  );
  static final TextStyle rating = TextStyle(
    // fontFamily: 'SP',
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.appText,

  );
  static final TextStyle source = TextStyle(
    // fontFamily: 'SP',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.appText,

  );
  static final TextStyle labels = TextStyle(
    // fontFamily: 'SP',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: Colors.grey,

  );
  static final TextStyle bodyText = TextStyle(
    // fontFamily: 'SP',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    color: AppColors.appText,

  );
}