// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/DB/sqflite.dart';
import 'package:quiz_app/themes/staticdata.dart';
import 'package:quiz_app/views/home_screen.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  var selectedTabIndex = 0;
  var fullName = "";
  var profilePic = "";
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  String? image;
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__124324__');

  var isLoading = false;
  var passwordInVisible = true;
  initalizedata() {
    firstNameController.text = StaticData.userModel!.firstname;
    lastNameController.text = StaticData.userModel!.lastname;
    emailController.text = StaticData.userModel!.email;
    passwordController.text = StaticData.userModel!.password;
    phoneNumberController.text = StaticData.userModel!.mobile;
    image = StaticData.userModel!.profilePic;
    // update();
  }

  XFile? hpickedFile;
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

  Future<void> updateprofile(BuildContext context) async {
    if (hpickedFile != null) {
      var map = {
        'firstname': firstNameController.text,
        'lastname': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'mobile': phoneNumberController.text,
        'profilePic': hpickedFile!.path,
      };
      try {
        var result = await SQLService.updateData(
            'UserModel', map, StaticData.userModel!.id);
        print("resultresult${result.toString()}");
      } catch (e) {
        print("Error in updateprofile: $e");
      }

      Fluttertoast.showToast(
          msg: "Update Succssfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      StaticData.updatepatientprofile().then((value) {
        initalizedata();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      });
    } else {
      try {
        var map = {
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'mobile': phoneNumberController.text,
        };
        var result = await SQLService.updateData(
            'UserModel', map, StaticData.userModel!.id);
        print("resultresult${result.toString()}");
      } catch (e) {
        print("Error in updateprofile: $e");
      }

      Fluttertoast.showToast(
          msg: "Update Succssfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      await StaticData.updatepatientprofile().then((value) {
        initalizedata();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      });
    }
  }
}
