import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/DB/database_querys.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/themes/staticdata.dart';
import 'package:quiz_app/views/home_screen.dart';
import 'package:quiz_app/views/login_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  XFile? hpickedFile;
  String? image;
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> signinFormKey =
      GlobalKey<FormState>(debugLabel: '__signinFormKey__');

  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();
  var isLoading = false;
  var passwordInVisible = true;

  var isLoading1 = false;
  var passwordInVisible1 = true;
  pickImage(ImageSource source) async {
    var pickedImage = await ImagePicker().pickImage(source: source);
    update();
    if (pickedImage != null) {
      hpickedFile = pickedImage;
      update();
    }
    print("xfileimage$hpickedFile");
    return hpickedFile;
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      SQLQuery.getdata("Select * from UserModel").then((value) {
        print("modelelelelelele${value.toString()}");
      });
      var query =
          "SELECT * FROM UserModel where email='${emailController1.text}' AND password='${passwordController1.text}'";
      await SQLQuery.getdata(query).then((value) async {
        print("snaaaaaap    $value");
        UserModel? model;
        try {
          model = UserModel.fromMap(value[0]);
          print("modeleelel$model");
        } catch (e) {
          print("lsdfgjd$e");
          Fluttertoast.showToast(
              msg: "User Not Found !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }

        StaticData.userModel = model;
        update();

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
        Fluttertoast.showToast(
            msg: "Login Succesfull",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        StaticData.cleardata(context).then((value) {
          prefs.setString("UserModel", model!.id);
          clearForm1();
        });
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "User Not Found !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void register(context) async {
    try {
      String id = const Uuid().v4();
      UserModel model = UserModel(
          id: id,
          profilePic: hpickedFile!.path,
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          mobile: phoneNumberController.text);
      var query = "INSERT INTO UserModel VALUES (${model.toMap()})";
      SQLQuery.postdata(query).then((value) {
        clearForm();
        SQLQuery.getdata("Select * from UserModel").then((value) {
          print("modelelelelelele${value.toString()}");
        });
        Fluttertoast.showToast(
          msg: "Signup Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
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

  clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    hpickedFile = null;
    image = null;
    update();
  }

  clearForm1() {
    passwordController1.clear();
    passwordController1.clear();

    update();
  }
}
