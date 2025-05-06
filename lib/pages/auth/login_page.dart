import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/bloc/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:final_project/constants/app_colors.dart';
import 'package:final_project/constants/app_styles.dart';
import 'package:final_project/generated/locale_keys.g.dart';
import 'package:final_project/pages/auth/registration_page.dart';
import 'package:final_project/pages/home_page.dart';
import 'package:final_project/shared_preferences/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool obscurePsw = true;
  String? _errorMsg;

  void _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final user = await AuthService.signIn(email, password);

    if (user != null) {
      await AuthService.editCurrentUser(user);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage(user: user)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid credentials')));
    }
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
        title: Text(LocaleKeys.sign_in.tr(),
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

              children: [
                TextFormField(

                  style: AppTextStyles.bodyText,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _emailFocus, _passwordFocus);
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
                      return  LocaleKeys.wrong_format.tr();
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
                        _signIn();

                      }
                    },
                    child: Text(LocaleKeys.sign_in).tr()),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(LocaleKeys.do_not_have_account, style: AppTextStyles.plotDescription,).tr(),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                  builder: (context) => RegistrationPage()
                              ), (route) => false,);

                            },
                            child: Text(" ${LocaleKeys.sign_up.tr()}", style: AppTextStyles.genres,)),
                      ],
                    )
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