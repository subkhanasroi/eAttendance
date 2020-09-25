import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class AddPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "Sign in Absent",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
