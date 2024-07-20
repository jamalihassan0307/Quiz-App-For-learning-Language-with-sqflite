import 'package:get/get.dart';
import 'package:quiz_app/controller/login_controller.dart';
import 'package:quiz_app/themes/color.dart';
import 'package:quiz_app/views/login_signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.lighterPrimary,
        body: GetBuilder<LoginController>(builder: (obj) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello There 👋",
                    style: TextStyle(
                        fontSize: 24,
                        color: ThemeColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Form(
                      key: obj.signinFormKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.textPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: obj.emailController1,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  color: ThemeColor.black, fontSize: 14),
                              // maxLength: 10,
                              decoration: InputDecoration(
                                counterText: '',
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 18,
                                ),
                                contentPadding: const EdgeInsets.all(12),
                                // floatingLabelBehavior:
                                //     FloatingLabelBehavior.never,
                                hintText: "Email Id",
                                hintStyle: const TextStyle(
                                    fontSize: 14, color: ThemeColor.grey_500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: ThemeColor.white,
                              ),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ThemeColor.textPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: obj.passwordController1,
                              keyboardType: TextInputType.text,
                              obscureText: obj.passwordInVisible1,
                              style: const TextStyle(
                                  color: ThemeColor.black, fontSize: 14),
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  size: 18,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      obj.passwordInVisible1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      obj.passwordInVisible1 =
                                          !obj.passwordInVisible1;
                                    }),
                                contentPadding: const EdgeInsets.all(12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    fontSize: 14, color: ThemeColor.grey_500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                filled: true,
                                fillColor: ThemeColor.white,
                              ),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ])),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: const Text(
                  //     "Forgot Password?",
                  //     style: TextStyle(
                  //         fontSize: 14,
                  //         color: ThemeColor.accent,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 44,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          obj.signInWithEmailAndPassword(context);
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: ThemeColor.primaryDark,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            children: [
                          const TextSpan(
                            text: "Don't have the account yet? ",
                            style: TextStyle(
                              color: ThemeColor.grey,
                            ),
                          ),
                          TextSpan(
                              text: "Sign up",
                              style: const TextStyle(
                                  color: ThemeColor.primary,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage(),
                                      ));
                                })
                        ])),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: "By continuing, you agree to the ",
                              style: TextStyle(
                                color: ThemeColor.grey,
                              ),
                            ),
                            TextSpan(
                                text: "Terms of service & Privacy Policy",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.bold)),
                          ]))
                ],
              ),
            ),
          );
        }));
  }
}
