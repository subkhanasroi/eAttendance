import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/pages/pages.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedItemIndex = 1;
  var _pages = [ListPage(), AddPage(), ProfilPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedItemIndex],
      ),
      bottomNavigationBar: Row(
        children: [
          buildNavbarItem(Icons.assignment_turned_in, 0),
          buildNavbarItem(Icons.add_circle, 1),
          buildNavbarItem(Icons.account_circle, 2),
        ],
      ),
    );
  }

  Widget buildNavbarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: kPrimaryColor)),
                gradient: LinearGradient(colors: [
                  kPrimaryColor.withOpacity(0.3),
                  kPrimaryColor.withOpacity(0.015)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                color: index == _selectedItemIndex
                    ? kPrimaryColor
                    : kSecondaryColor)
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? kPrimaryColor : kSecondaryColor,
        ),
      ),
    );
  }
}
