// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:quiz_app/DB/database_querys.dart';
import 'package:quiz_app/controller/login_controller.dart';
import 'package:quiz_app/controller/user_controller.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/themes/color.dart';
import 'package:quiz_app/themes/staticdata.dart';
import 'package:quiz_app/views/home_screen.dart';
import 'package:quiz_app/views/login_signup/wellcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Get.put(UserController());
    Get.put(LoginController());
    getDataFromSF();

    super.initState();
  }

  Future<void> fetchpatientByUUID(String uuid, context) async {
    UserModel? users;
    var q = "SELECT * FROM UserModel where id='$uuid'";
    try {
      SQLQuery.getdata(q).then((value) async {
        print("snaaaaaap    $value");

        print("get data$value");
        try {
          if (value ==
              "Error: java.sql.SQLException: Network error IOException: Connection timed out") {
            print("aaasdadddasdadad");
          }
          //  else if(value.lenght==0){

          //   Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const WelcomeScreen(),
          //   ),
          //   (route) => true,
          // );
          //  }
          else {
            users = UserModel.fromMap(value[0]);
          }
        } catch (e) {
          print('Document with UUID $uuid does not exist.$e');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ),
            (route) => true,
          );

          return;
        }

        StaticData.userModel = users!;

        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => true,
          );
        });

        print("Current user: $users");
      });
    } catch (e) {
      print('Document with UUID $uuid does not exist.');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => true,
      );

      print('Error fetching user data: $e');
    }
  }

  Future<bool?> getDataFromSF() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? v = prefs.getString("UserModel");
      print("v:$v");
      if (v != null && v != "") {
        try {
          await fetchpatientByUUID(v, context);
          return true;
        } catch (e) {
          print("error");
        }
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ),
          (route) => true,
        );
        return false;
      }
    } catch (e) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => true,
      );
      return false;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primary,
        body: Stack(
          children: [
            Image.asset(
              "assets/splash_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Quiz App",
                      style: TextStyle(
                          fontSize: 32,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Thunder",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "App version v1.0.0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeColor.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
