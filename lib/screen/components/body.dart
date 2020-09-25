import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/screen/components/splash_content.dart';
import 'package:eattendanceapps/screen/sign_in/sign_in_screen.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/login.jpg",
      "text": "Selamat Datang di eAbsensi Edukreasi",
    },
    {
      "image": "assets/images/add.jpg",
      "text": "Absen mudah dan cepat",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3)));
  }
}
