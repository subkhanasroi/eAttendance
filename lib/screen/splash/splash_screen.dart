import 'package:eattendanceapps/screen/components/body.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
