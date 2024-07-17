import 'package:quiz_app/controller/profile_controller.dart';
import 'package:quiz_app/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Get.put(UserController());
    super.initState();
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  var isLoading = false;
  var passwordInVisible = true;
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: ThemeColor.primary,
        elevation: 0,
      ),
      backgroundColor: ThemeColor.primary,
      body: GetBuilder<UserController>(builder: (obj) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 36),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                decoration: BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
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
                                          color: ThemeColor.primary),
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
                                          color: ThemeColor.primary),
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
                                          color: ThemeColor.primary),
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
                                          color: ThemeColor.primary),
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
                                          passwordInVisible =
                                              !passwordInVisible;
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
                                          color: ThemeColor.primary),
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: ThemeColor.white,
                                ),
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(height: height * 0.02),
                              SizedBox(
                                  width: double.infinity,
                                  height: 44,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: ThemeColor.primaryDark,
                                    ),
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ])),
                  ],
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("${obj.user.profilePic}"),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
