import 'package:eattendanceapps/screen/sign_up/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
