import 'package:aris_language_learning/themes/color.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false;
  var passwordInVisible = true;
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create an Account 👋",
                  style: TextStyle(
                      fontSize: 24,
                      color: ThemeColor.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 44,
                ),
                Form(
                    key: signupFormKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeColor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "First Name",
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
                            "Last Name",
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeColor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Last Name",
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
                            "Email Address",
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeColor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Email",
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
                            "Mobile Number",
                            style: TextStyle(
                                fontSize: 14,
                                color: ThemeColor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: const Icon(
                                Icons.phone_outlined,
                                size: 18,
                              ),
                              contentPadding: const EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Phone Number",
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
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: passwordInVisible,
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
                                    passwordInVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordInVisible = !passwordInVisible;
                                    });
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
                const SizedBox(
                  height: 44,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: ThemeColor.primaryDark,
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
