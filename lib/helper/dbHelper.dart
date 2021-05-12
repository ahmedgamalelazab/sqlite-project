// import 'dart:async';
// import 'package:sqflite/sqflite.dart' as sql;
// import 'package:path/path.dart' as path;
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   //inserting table in the sqlite db
//   static Future<Database> dataBase() async {
//     // first u have to detect the path
//     final dbPath = await sql
//         .getDatabasesPath(); // get recommended sqlite db for android or ios
//     return await sql.openDatabase(path.join(dbPath, 'placs.db'),
//         onCreate: (db, version) {
//       //open up in the first time , u have to create a damn table
//       db.execute(
//           'CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT , image TEXT)');
//     }, version: 1);

//     //inserting now in the db
//   }

//   //section of query
//   static Future<void> insert(String table, Map<String, dynamic> data) async {
//     await DBHelper.dataBase()
//       ..insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     await DBHelper.dataBase()
//       ..query(table);
//   }
// }
