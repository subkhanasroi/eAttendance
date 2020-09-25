import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/sign_up/sign_up.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont Have an account?",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
            )),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
