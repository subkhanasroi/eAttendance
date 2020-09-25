import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7647);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

final RegExp usernameValidatorRegExp = RegExp(r"^[a-zA-z0-9.]+");
const String kUsernameNullError = "Please Enter your Username";
const String kInvalidUsernameError = "Please Enter Valid Username";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Password is too Short";
const String kMatchPassError = "Password don't match";
