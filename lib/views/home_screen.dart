import 'package:aris_language_learning/models/flutter_topics_model.dart';
import 'package:aris_language_learning/views/pofile/pofile_page.dart';
import 'package:aris_language_learning/views/quiz_pages/flashcard_screen.dart';
import 'package:aris_language_learning/views/quiz_pages/level.dart';
import 'package:aris_language_learning/widgets/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator/translator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                for (var i = 0; i < "Learn New Skills!!!".length; i++) ...[
                  TextSpan(
                    text: "Learn New Skills!!!"[i],
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
                    //       await translator
                    //   .translate("سیب کا اردو میں کیا مطلب ہے",  to: 'hi')
                    //   .then((translatedWord) {
                    //     print("ksksf   ${translatedWord.text}");
                    // // if (translatedWord.text == _wordController.text) {
                    // //   messenger.toast(S.of(context).couldntFoundTranslate);
                    // // } else {
                    // //   _conceptController.text = translatedWord.text;
                    // // }
                    //   });

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
                          Icon(
                            topicsData.topicIcon,
                            color: Colors.white,
                            size: 55,
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
          // listTileMyQuiz(context),
          listTileprofile(context),
          listTileAbout(context),
          listTileTerms(context),
          listTileShare(context),
        ],
      ),
    ),
  );
}

ListTile listTileMyQuiz(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(left: 20),
    leading:
        const Icon(FontAwesomeIcons.receipt, size: 20, color: Colors.black),
    title: Text(
      "My Quiz",
      style: TextStyle(
        fontSize: setSize(context, 18),
        fontWeight: FontWeight.w400,
      ),
    ),
    onTap: () {},
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
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const AboutPage()));
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
    onTap: () async {
      // await launchUrlString(termsConditionsURL,
      //     webOnlyWindowName: "Terms And Conditions");
      Navigator.pop(context);
    },
  );
}

ListTile listTileShare(context) {
  return ListTile(
    contentPadding: const EdgeInsets.only(top: 15, left: 20),
    leading:
        const Icon(FontAwesomeIcons.shareNodes, size: 20, color: Colors.black),
    title: Text(
      "Share",
      style: TextStyle(
          fontSize: setSize(context, 18), fontWeight: FontWeight.w400),
    ),
    onTap: () async {
      // await launchUrlString(appLink,
      // webOnlyWindowName: "App Share");
      Navigator.pop(context);
    },
  );
}
