import 'dart:ui';

import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/models/activity_info.dart';
import 'package:eattendanceapps/repositories/database_connection.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class ListPageScreen extends StatefulWidget {
  @override
  _ListPageScreenState createState() => _ListPageScreenState();
}

class _ListPageScreenState extends State<ListPageScreen> {
  // int _counter = 0;
  // Uint8List _imageFile;
  // ScreenshotController screenshotController = ScreenshotController();

  DBHelper _dbHelper = DBHelper();
  Future<List<ActivityInfo>> _activities;
  List<Color> colorBg = [Colors.green[300], Colors.red[300]];
  @override
  void initState() {
    _dbHelper.initDB().then((value) {
      print('------------database initialized');
      refreshList();
    });
    super.initState();
  }
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  refreshList() {
    _activities = _dbHelper.getAvtivity();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            Text(
              "My Absent",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            // FlatButton(
            //     onPressed: () {
            //       _incrementCounter();
            //       _imageFile = null;
            //       screenshotController
            //           .capture(delay: Duration(milliseconds: 10))
            //           .then((Uint8List image) async {
            //         _imageFile = image;
            //         showDialog(
            //             context: context,
            //             builder: (context) => Scaffold(
            //                   appBar:
            //                       AppBar(title: Text("Captured Screenshoot")),
            //                   body: Center(
            //                     child: Column(
            //                       children: [
            //                         _imageFile != null
            //                             ? Image.memory(_imageFile)
            //                             : Container()
            //                       ],
            //                     ),
            //                   ),
            //                 ));
            //       });
            //     },
            //     color: kPrimaryColor,
            //     padding: EdgeInsets.all(10.0),
            //     child: Column(
            //       children: [Icon(Icons.print), Text("Cetak")],
            //     )),
            Expanded(
              child: FutureBuilder(
                future: _activities,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Text("tidak ada");
                  }
                  return ListView(
                      children: snapshot.data.map<Widget>((activity) {
                    var date = DateFormat('dd-MMM-yyyy hh:mm aa')
                        .format(activity.activityDateTime);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      color: colorBg[activity.warnaBG],
                      child: Column(
                        children: [
                          Text(date, style: TextStyle(color: Colors.white)),
                          Text(activity.description,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    );
                  }).toList());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
