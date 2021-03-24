import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/sign_in/sign_in_screen.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilPageScreen extends StatefulWidget {
  @override
  _ProfilPageScreenState createState() => _ProfilPageScreenState();
}

class _ProfilPageScreenState extends State<ProfilPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              CircleAvatar(
                radius: 55,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/add.jpg'),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "Subkhan Asroi",
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.only(left: 150),
                child: Row(
                  children: [
                    Text("Programmer",
                        style: TextStyle(color: kPrimaryColor, fontSize: 15)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor,
                    onPressed: () {
                      _signOut();
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
