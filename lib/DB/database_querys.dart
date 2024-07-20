// ignore_for_file: avoid_print

import 'package:quiz_app/DB/sqflite.dart';

class SQLQuery {
  static Future getdata(query) async {
    try {
      var result = await SQLService.get(query);

      return result;
    } catch (e) {
      print("Error in Simple get query: $e");
      return [];
    }
  }

  static Future postdata(query) async {
    try {
      var result = await SQLService.post(query);
      print("hjvg$result");

      return result;
    } catch (e) {
      print("Error in Simple post query: $e");
      return [];
    }
  }

  static Future updatedata(
      String tableName, Map<String, dynamic> map, String id, query) async {
    try {
      var result = await SQLService.updateData(tableName, map, id);

      return result;
    } catch (e) {
      print("Error in Simple update query: $e");
      return [];
    }
  }

  static Future deletedata(query) async {
    try {
      var result = await SQLService.delete(query);

      return result;
    } catch (e) {
      print("Error in Simple update query: $e");
      return [];
    }
  }

  static Future createTabledata(query) async {
    try {
      var result = await SQLService.randomCreateTable(query);

      return result;
    } catch (e) {
      print("Error in Simple random_create_table query: $e");
      return [];
    }
  }
}
