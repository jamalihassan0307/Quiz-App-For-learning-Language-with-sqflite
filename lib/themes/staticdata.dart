import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/models/user_model.dart';
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
  }
}
