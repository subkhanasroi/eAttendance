import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/bottom_navbar/bottom_navbar_screen.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/7566.jpg",
          height: SizeConfig.screenHeight * 0.4,
        ),
        Center(
          child: Text(
            "Login Success",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.4,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: kPrimaryColor,
            onPressed: () {
              Navigator.pushNamed(context, ButtomNavbarScreen.routeName);
            },
            child: Text(
              "Back to home",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
