//this is the configration of my db
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

//MY BACK END
class DBConnect {
  static Future<Database> sqliteDB() async {
    //first get the uri
    final pathUri = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(pathUri, "place.sql"),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE place(id TEXT PRIMARY KEY , title TEXT , image TEXT)');
    }, version: 1);
  }
}
