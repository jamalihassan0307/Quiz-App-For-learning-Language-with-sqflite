// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, deprecated_member_use

import 'dart:io';

import 'package:quiz_app/models/flutter_topics_model.dart';
import 'package:quiz_app/themes/color.dart';
import 'package:quiz_app/themes/staticdata.dart';
import 'package:quiz_app/views/about.dart';
import 'package:quiz_app/views/login_signup/wellcome.dart';
import 'package:quiz_app/views/old_result.dart';
import 'package:quiz_app/views/pofile/pofile_page.dart';
import 'package:quiz_app/views/quiz_pages/level.dart';
import 'package:quiz_app/views/terms_condition.dart';
import 'package:quiz_app/views/tranlater.dart';
import 'package:quiz_app/widgets/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    String name =
        '${StaticData.userModel!.firstname} ${StaticData.userModel!.lastname}';
    // final translator = GoogleTranslator();
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Center(
          child: RichText(
            text: TextSpan(
              children: [
                for (var i = 0; i < name.length; i++) ...[
                  TextSpan(
                    text: name[i],
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 18 + i.toDouble(),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ]
              ],
            ),
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: StaticData.userModel!.profilePic != null
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        FileImage(File(StaticData.userModel!.profilePic!)),
                  )
                : const CircleAvatar(
                    radius: 25,
                    backgroundColor: ThemeColor.primaryDark,
                  ),
          ),
          SizedBox(width: width * 0.02),
        ],
        backgroundColor: const Color(0xFF5170FD),
      ),
      backgroundColor: bgColor3,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor3,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.24),
                    blurRadius: 20.0,
                    offset: const Offset(0.0, 10.0),
                    spreadRadius: -10,
                    blurStyle: BlurStyle.outer,
                  )
                ],
              ),
              child: Image.asset("assets/dash.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Language ",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    for (var i = 0; i < "Learning!!!".length; i++) ...[
                      TextSpan(
                        text: "Learning!!!"[i],
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 21 + i.toDouble(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: flutterTopicsList.length,
              itemBuilder: (context, index) {
                final topicsData = flutterTopicsList[index];
                return GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Level(
                          typeOfTopic: topicsData.topicQuestions,
                          topicName: topicsData.topicName,
                        ),
                      ),
                    );
                    print(topicsData.topicName);
                  },
                  child: Card(
                    color: bgColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.15,
                            child: Image.asset(
                              topicsData.topicName == "English"
                                  ? "assets/english.png"
                                  : topicsData.topicName == "Urdu"
                                      ? "assets/urdu.png"
                                      : topicsData.topicName == "Bengali"
                                          ? "assets/bengali.png"
                                          : topicsData.topicName == "German"
                                              ? "assets/german.png"
                                              : topicsData.topicName == "Hindi"
                                                  ? "assets/hindi.png"
                                                  : topicsData.topicName ==
                                                          "sindhi"
                                                      ? "assets/sind.png"
                                                      : "assets/punjabi.png",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            topicsData.topicName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,
      drawer: navigationDrawer(context),
    );
  }
}

Drawer navigationDrawer(context) {
  return Drawer(
    width: screenWidth(context) / 1.6,
    elevation: 20,
    child: SingleChildScrollView(
      child: Column(
        children: [
          drawerHeader(context),
          listTileprofile(context),
          listTileResult(context),
          listTileTranlate(context),
          listTileAbout(context),
          listTileTerms(context),
          listTileLogOut(context),
          listTileDelete(context),
        ],
      ),
    ),
  );
}

ListTile listTileAbout(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.circleInfo, size: 20, color: Colors.black),
    title: Text(
      "About Us",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AboutPage()));
    },
  );
}

listTileprofile(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.userShield, size: 20, color: Colors.black),
    title: Text(
      "Profile",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ));
    },
  );
}

listTileTerms(context) {
  return ListTile(
    style: ListTileStyle.drawer,
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(FontAwesomeIcons.bookOpenReader,
        size: 20, color: Colors.black),
    title: Text(
      "Terms and Conditions",
      style: TextStyle(
          fontSize: setSize(context, 17), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TermsAndConditionsPage(),
          ));
    },
  );
}

ListTile listTileResult(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.history, size: 20, color: Colors.black),
    title: Text(
      "Old Result",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OldResultPage(),
          ));
    },
  );
}

ListTile listTileTranlate(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(Icons.translate, size: 20, color: Colors.black),
    title: Text(
      "Google Tranlation",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TranslatePage(),
          ));
    },
  );
}

ListTile listTileLogOut(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(Icons.login_outlined, size: 20, color: Colors.black),
    title: Text(
      "LogOut",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      StaticData.cleardata(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => false,
      );
    },
  );
}

ListTile listTileDelete(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading: const Icon(Icons.delete, size: 20, color: Colors.red),
    title: Text(
      "Delete Account",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      Navigator.pop(context);
      StaticData.cleardata(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => false,
      );
    },
  );
}
