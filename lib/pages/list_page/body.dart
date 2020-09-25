import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';

class ListPageScreen extends StatefulWidget {
  @override
  _ListPageScreenState createState() => _ListPageScreenState();
}

class _ListPageScreenState extends State<ListPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            Text(
              "My Absent",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
