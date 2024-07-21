// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/DB/database_querys.dart';
import 'package:quiz_app/models/result_model.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/views/login_signup/wellcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class StaticData {
  static UserModel? userModel;
  static List<ResultModel> result_model_list = [];

  static Future<String> assetToF(String assetPath) async {
    String directory = (await getTemporaryDirectory()).path;
    List<String> pathParts = assetPath.split('/');
    String fileName = pathParts.last;
    String filePath = '$directory/$fileName';
    File existingFile = File(filePath);
    if (await existingFile.exists()) {
      return existingFile.path;
    } else {
      ByteData data = await rootBundle.load(assetPath);
      Uint8List bytes = data.buffer.asUint8List();
      File file = File(filePath);
      await file.writeAsBytes(bytes);
      return file.path;
    }
  }

  static Future cleardata(BuildContext context) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    a.getKeys();
    a.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
      (route) => false,
    );
  }

  static Future<void> updatepatientprofile() async {
    try {
      var query = "SELECT * FROM UserModel where id='${userModel!.id}'";
      await SQLQuery.getdata(query).then((value) async {
        print("snaaaaaap    $value");

        print("get data");
        try {
          var model1 = UserModel.fromMap(value[0]);

          userModel = model1;
        } catch (e) {
          return;
        }
      });
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static Future<void> gettheresult() async {
    try {
      result_model_list.clear();
      var query = "SELECT * FROM ResultModel ";
      await SQLQuery.getdata(query).then((value) async {
        print("snaaaaaap    $value");

        print("get data");
        try {
          List<Map<String, dynamic>> tempResult =
              value.cast<Map<String, dynamic>>();
          for (var element in tempResult) {
            result_model_list.add(ResultModel.fromMap(element));
          }
          print(result_model_list.length);
        } catch (e) {
          print("EEEEEERRRRROOOOORRR$e");
          return;
        }
      });
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static Future<void> deleteAccount() async {
    try {
      var query = "DELETE FROM UserModel  where id='${userModel!.id}'";
      await SQLQuery.getdata(query).then((value) async {
        print("snaaaaaap    $value");

        print("get data");
        userModel = null;
      });
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static void addResultData(ResultModel model, context) async {
    try {
      var query = "INSERT INTO ResultModel VALUES (${model.toMap()})";
      SQLQuery.postdata(query).then((value) {
        SQLQuery.getdata("Select * from ResultModel").then((value) {
          print("modelelelelelele${value.toString()}");
        });
        Fluttertoast.showToast(
          msg: "Add Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    } catch (e) {
      print("eror${e.toString()}");
      Fluttertoast.showToast(
        msg: "Check internet connecti...or try another email${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static String formatDateTime(DateTime dateTime) {
    var formatter = DateFormat('MM/dd/yyyy hh:mm a');
    return formatter.format(dateTime);
  }
}
