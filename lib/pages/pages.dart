import 'package:eattendanceapps/pages/add_page/body.dart';
import 'package:eattendanceapps/pages/list_page/body.dart';
import 'package:eattendanceapps/pages/profil_page/body.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListPageScreen(),
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddPageScreen(),
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProfilPageScreen(),
      ),
    );
  }
}
