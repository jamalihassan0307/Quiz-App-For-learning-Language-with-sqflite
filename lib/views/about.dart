import 'package:flutter/material.dart';
import 'package:quiz_app/themes/color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor.lighterPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: ThemeColor.lighterPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.15,
              decoration: const BoxDecoration(
                color: ThemeColor.lighterPrimary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'About My App',
                    style: TextStyle(
                      color: ThemeColor.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/logo.png",
                      width: width * 0.1,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to My App!',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Learn languages with quizzes and store quiz results automatically. '
                        'The app supports English, German, Urdu, Hindi, Bengali, Punjabi, and Sindhi.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Features:',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '- Login, signup, and profile update functionalities.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '- Integrated dictionary and Google Translator '
                        'for translating words and sentences across languages.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Mission:',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Our mission is to make language learning engaging and accessible '
                        'for learners worldwide.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Values:',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '- Customer satisfaction is our top priority.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      Text(
                        '- We strive for continuous improvement.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      Text(
                        '- We value honesty and integrity in all our actions.',
                        style: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Awards and Recognition:',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: Icon(
                          Icons.check,
                          size: width * 0.05,
                        ),
                        title: Text(
                          'Best Language Learning App, 2023',
                          style: TextStyle(
                            fontSize: width * 0.03,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.check,
                          size: width * 0.05,
                        ),
                        title: Text(
                          'Innovation Award, 2024',
                          style: TextStyle(
                            fontSize: width * 0.03,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
