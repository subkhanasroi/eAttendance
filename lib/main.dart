import 'package:eattendanceapps/routes.dart';
import 'package:eattendanceapps/screen/splash/splash_screen.dart';
import 'package:eattendanceapps/screen/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
