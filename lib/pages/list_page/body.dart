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
            Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: 100,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          children: [Text("Masuk")],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
