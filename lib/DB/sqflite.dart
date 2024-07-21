// ignore_for_file: avoid_print

import 'dart:io';
// import 'package:doctor_appointment_app/SQL/Sql_query.dart';
// import 'package:quiz_app/DB/database_querys.dart';
// import 'package:quiz_app/models/result_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLService {
  static Database? _db;

  static Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await openDB();
    return _db!;
  }

  static Future<void> deleteOldDatabase() async {
    try {
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'quizapp.db');
      print("Attempting to delete old database");

      if (await File(path).exists()) {
        await File(path).delete();
        print("Old database deleted");
      }
    } catch (e) {
      print("Error deleting old database: $e");
    }
  }

  static Future<Database> openDB() async {
    try {
      // await deleteOldDatabase();
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'quizapp.db');

      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await createTables(db);
        },
      );
      print("Database opened successfully");
      _db = db;
      return db;
    } catch (e) {
      print("ERROR IN OPEN DATABASE: $e");
      throw Exception("Failed to open database: $e");
    }
  }

  static Future<void> createTables(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS UserModel (
        id VARCHAR(255) NOT NULL PRIMARY KEY,
        firstname VARCHAR(255) NOT NULL,
        lastname VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        mobile VARCHAR(255) NOT NULL,
        profilePic VARCHAR(255)
      );
    ''');

      await db.execute('''
      CREATE TABLE IF NOT EXISTS ResultModel (
        id VARCHAR(255) NOT NULL PRIMARY KEY,
        result VARCHAR(255) NOT NULL,
        award VARCHAR(255) NOT NULL,
        percentage VARCHAR(255) NOT NULL,
        language VARCHAR(255) NOT NULL,
        image VARCHAR(255) NOT NULL
      );
    ''');

      print("Tables created successfully");
    } catch (e) {
      print("ERROR IN CREATE TABLE: $e");
      throw Exception("Failed to create tables: $e");
    }
  }

  static Future<void> randomCreateTable(String query) async {
    try {
      await _db?.execute(query);
      print("Table created with query: $query");
    } catch (e) {
      print("ERROR IN CREATING TABLE: $e");
      throw Exception("Failed to create table: $e");
    }
  }

  static Future<List<String>> getAllTables() async {
    try {
      List<Map<String, Object?>>? result = await _db
          ?.rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
      print("434534$result");
      List<String> tables =
          result!.map((row) => row['name'] as String).toList();
      return tables;
    } catch (e) {
      print("Error in getAllTables: $e");
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>?> get(String query) async {
    try {
      print("Executing query: $query");
      return await _db?.rawQuery(query);
    } catch (e) {
      print("ERROR IN GET QUERY: $e");
      throw Exception("Failed to execute get query: $e");
    }
  }

  static Future<int?> post(String query) async {
    try {
      print("Executing insert query: $query");
      return await _db?.transaction((txn) async {
        return await txn.rawInsert(query);
      });
    } catch (e) {
      print("ERROR IN INSERT QUERY: $e");
      throw Exception("Failed to execute insert query: $e");
    }
  }

  static Future<int?> updateData(
      String tableName, Map<String, dynamic> map, String id) async {
    try {
      String query = 'UPDATE $tableName SET ';
      List<String> columns = [];
      List<dynamic> values = [];

      map.forEach((column, value) {
        columns.add('$column = ?');
        values.add(value);
      });

      query += columns.join(', ');
      query += ' WHERE id = ?';
      values.add(id);

      print("Executing update query: $query with values: $values");
      return await _db?.rawUpdate(query, values);
    } catch (e) {
      print("ERROR IN UPDATE QUERY: $e");
      throw Exception("Failed to execute update query: $e");
    }
  }

  static Future<int?> updateDataid(
    String tableName,
    Map<String, dynamic> map,
    Map<String, dynamic> mapid,
  ) async {
    try {
      String query = 'UPDATE $tableName SET ';
      List<String> columns = [];
      List<dynamic> values = [];

      map.forEach((column, value) {
        columns.add('$column = ?');
        values.add(value);
      });

      query += columns.join(', ');
      mapid.forEach((column, value) {
        query += ' WHERE $column = ? = ?';
        values.add(value);
      });

      print("Executing update query: $query with values: $values");
      return await _db?.rawUpdate(query, values);
    } catch (e) {
      print("ERROR IN UPDATE QUERY: $e");
      throw Exception("Failed to execute update query: $e");
    }
  }

  static Future<int?> delete(String query) async {
    try {
      print("Executing delete query: $query");
      return await _db?.rawDelete(query);
    } catch (e) {
      print("ERROR IN DELETE QUERY: $e");
      throw Exception("Failed to execute delete query: $e");
    }
  }
}
