import 'package:eattendanceapps/screen/bottom_navbar/bottom_navbar_screen.dart';
import 'package:eattendanceapps/screen/complete_profil/complete_profile_screen.dart';
import 'package:eattendanceapps/screen/forgot_password/forgot_password_screen.dart';
import 'package:eattendanceapps/screen/login_success/login_success_screen.dart';
import 'package:eattendanceapps/screen/sign_in/sign_in_screen.dart';
import 'package:eattendanceapps/screen/sign_up/sign_up.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  //SplashScreen.routeName:(context) =>SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ButtomNavbarScreen.routeName: (context) => ButtomNavbarScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
};
