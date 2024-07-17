import 'package:quiz_app/themes/color.dart';
import 'package:quiz_app/views/login_signup/login.dart';
import 'package:quiz_app/views/login_signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/people_connect.png",
                      width: 280,
                      height: 280,
                    ),
                    const SizedBox(
                      height: 84,
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
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(children: [
                          const Text(
                            "Take part in challenges with friends",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: ThemeColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage(),
                                      ));
                                },
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                                child: const Text("Sign Up",
                                    style: TextStyle(color: Colors.white)),
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ));
                            },
                            child: RichText(
                                text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                      color: ThemeColor.grey_500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                        color: ThemeColor.primary,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          )
                        ]),
                      )
                    ]))
          ],
        ));
  }
}
