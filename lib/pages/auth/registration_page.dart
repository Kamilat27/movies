
import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/bloc/auth/authentication_bloc/authentication_bloc.dart';
import 'package:final_project/bloc/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:final_project/bloc/auth/sign_up_bloc/sign_up_bloc.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/generated/locale_keys.g.dart';
import 'package:final_project/pages/auth/login_page.dart';
import 'package:final_project/shared_preferences/auth_service.dart';
import 'package:final_project/shared_preferences/image_service.dart';
import 'package:final_project/shared_preferences/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:user_repository/user_repository.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  String? _photoPath;

  bool obscurePsw = true;
  bool obscurePswConfirm = true;

  void _uploadImage() async {
    final path = await ImageService.uploadImage();
    if (path != null) {
      setState(() {
        _photoPath = path;
      });
    }
  }

  void _signUp() async {
    final user = User(
      id: Random().nextInt(100000).toString(), // Simple random ID
      name: _nameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
      photoPath: _photoPath!,
    );

    await AuthService.signUp(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
    }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bodyBackground,
        appBar: AppBar(
          backgroundColor: AppColors.appBarBackground,
          title: Text(LocaleKeys.sign_up.tr(),
            style: AppTextStyles.appBar,
          ),
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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: ListView(


                children: [
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: _uploadImage,

                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // clipBehavior: Clip.hardEdge,
                      child: _photoPath != null
                          ? Image.file(
                        File(_photoPath!),
                        width: 200, // radius * 2
                        height: 200,
                        fit: BoxFit.cover,
                      )
                          : Lottie.asset(
                        'assets/animations/add_photo.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    )

                  ),
                  SizedBox(height: 30,),
                  TextFormField(

                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _nameFocus, _lastNameFocus);
                    },
                    focusNode: _nameFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.name_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.person_3_outlined,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _nameController.clear();
                          },
                          child: Icon(
                            Icons.delete_outline,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return LocaleKeys.name_is_required.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(

                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _lastNameFocus, _emailFocus);
                    },
                    focusNode: _lastNameFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.lastname_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.person_2,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _lastNameController.clear();
                          },
                          child: Icon(
                            Icons.delete_outline,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return LocaleKeys.lastname_is_required.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _emailFocus, _phoneNumberFocus);
                    },
                    focusNode: _emailFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.email_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _emailController.clear();
                          },
                          child: Icon(
                            Icons.delete_outline,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return LocaleKeys.email_is_required.tr();
                      } else if (!_emailController.text.contains("@")) {
                        return LocaleKeys.wrong_format.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _phoneNumberFocus, _passwordFocus);
                    },
                    focusNode: _phoneNumberFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.phone_number_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _phoneNumberController.clear();
                          },
                          child: Icon(
                            Icons.delete_outline,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(
                          mask: '+7 (###) ###-##-##',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                          initialText: "+7 ")
                      // FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return LocaleKeys.phone_is_required.tr();
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: obscurePsw,
                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _passwordFocus, _emailFocus);
                    },
                    focusNode: _passwordFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(

                      labelText: LocaleKeys.password_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePsw = !obscurePsw;
                            }
                            );
                          },
                          icon: Icon(obscurePsw
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined)),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return LocaleKeys.password_is_required.tr();
                      } else if (_passwordController.text.length < 6) {
                        return LocaleKeys.password_error_least_num.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: obscurePswConfirm,
                    style: AppTextStyles.bodyText,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _passwordFocus, _confirmPasswordFocus);
                    },
                    focusNode: _confirmPasswordFocus,
                    onSaved: (value) {
                      // user.name = value;
                    },
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.confirm_password_label.tr(),
                      labelStyle: AppTextStyles.labels,
                      prefixIcon: Icon(
                        Icons.confirmation_number_sharp,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.icon, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePswConfirm = !obscurePswConfirm;
                            }
                            );
                          },
                          icon: Icon(obscurePswConfirm
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined)),
                    ),
                    validator: (val) {
                      if (_passwordController.text != val) {
                        return LocaleKeys.passwords_do_not_match.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(

                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.icon,
                          minimumSize: Size( MediaQuery.of(context).size.width, 55)
                      ),

                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // MyUser myUser = MyUser.empty;
                          // myUser = myUser.copyWith(
                          //   email: _emailController.text,
                          //   name: _nameController.text,
                          // );
                          _signUp();

                        }
                      },
                      child: Text(LocaleKeys.sign_up).tr()),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.have_account, style: AppTextStyles.plotDescription,).tr() ,
                      GestureDetector(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (context) => LoginPage()
                            ), (route) => false,);
                          },
                          child: Text(" ${LocaleKeys.sign_in.tr()}", style: AppTextStyles.genres,)),

                    ],
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        );
  }
}



void _fieldFocusChange(
    BuildContext context, FocusNode current, FocusNode next){
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}