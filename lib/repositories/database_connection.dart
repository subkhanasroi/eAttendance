import 'package:eattendanceapps/models/activity_info.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

final String tableActivity = "activities";
final String columnId = "id";
final String columnBG = "warnaBG";
final String columnDate = "activityDateTime";
final String columnDescription = "description";

class DBHelper {
  static const String DB_NAME = "pegawai.db";
  Database _db;
  static DBHelper _dbHelper;

  DBHelper._createInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper;
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    io.Directory docummentDirectory = await getApplicationDocumentsDirectory();
    String path = join(docummentDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableActivity($columnId INTEGER PRIMARY KEY,$columnBG TEXT NOT NULL,  $columnDescription TEXT NOT NULL, $columnDate TEXT NOT NULL)");
  }

  void insertActivity(ActivityInfo activityInfo) async {
    var dbClient = await this.db;
    var result = await dbClient.insert(tableActivity, activityInfo.toMap());
    print('result : $result');
  }

  Future<List<ActivityInfo>> getAvtivity() async {
    List<ActivityInfo> _activities = [];
    var dbClient = await this.db;
    var result = await dbClient.query(tableActivity);
    result.forEach((element) {
      var activityInfo = ActivityInfo.fromMap(element);
      _activities.add(activityInfo);
    });
    return _activities;
  }

  Future close() async {
    var dbClient = await this.db;
    dbClient.close();
  }
}
