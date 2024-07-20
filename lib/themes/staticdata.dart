// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/DB/database_querys.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/views/login_signup/wellcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticData {
  static UserModel? userModel;
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
}
