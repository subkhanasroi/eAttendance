import 'package:eattendanceapps/constants.dart';
import 'package:eattendanceapps/models/activity_info.dart';
import 'package:eattendanceapps/repositories/database_connection.dart';
import 'package:eattendanceapps/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class AddPageScreen extends StatelessWidget {
  var _absenController = TextEditingController();
  var _cutiController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  DBHelper _dbHelper = DBHelper();
  Future<List<ActivityInfo>> _activity;
  @override
  void initState() {
    _dbHelper.initDB().then((value) {
      print('------------database initialized');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              TimeInHourAndMinute(),
              SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      var activityInfo = ActivityInfo(
                          description: "Masuk Kerja",
                          warnaBG: 0,
                          activityDateTime: _dateTime);
                      _dbHelper.insertActivity(activityInfo);
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Absent Now".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (context, setModalState) {
                              return SingleChildScrollView(
                                child: Form(
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                          right: 32,
                                          left: 32,
                                          top: 32),
                                      color: Colors.red[100],
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                              maxLines: 10,
                                              controller: _absenController,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "Masukkan Keterangan")),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height:
                                                getProportionateScreenHeight(
                                                    56),
                                            child: FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              color: kPrimaryColor,
                                              onPressed: () {
                                                var activityInfo = ActivityInfo(
                                                    description:
                                                        _absenController.text,
                                                    warnaBG: 1,
                                                    activityDateTime:
                                                        _dateTime);
                                                _dbHelper.insertActivity(
                                                    activityInfo);

                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            18),
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      )),
                                ),
                              );
                            });
                          });
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Cuti".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
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

class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  var jam = '';
  void startJam() {
    Timer.periodic(Duration(seconds: 1), (_) {
      var tgl = DateTime.now();
      var formatjam = DateFormat.Hm().format(tgl);
      setState(() {
        jam = formatjam;
      });
    });
  }

  @override
  void initState() {
    startJam();
    super.initState();
  }

  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          jam,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        Text(_period),
      ],
    );
  }
}
