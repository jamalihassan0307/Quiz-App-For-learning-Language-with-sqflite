// ignore_for_file: deprecated_member_use, avoid_print

import 'package:quiz_app/models/bengali_questions_model.dart';
import 'package:quiz_app/views/quiz_pages/flashcard_screen.dart';
import 'package:flutter/material.dart';

// Example data model for keywords
class Keyword {
  final String name;
  final IconData icon;

  Keyword({required this.name, required this.icon});
}

// Example list of keywords
final List<Keyword> keywordsList = [
  Keyword(name: "Basic", icon: Icons.star),
  Keyword(name: "Intermediate", icon: Icons.grade),
  Keyword(name: "Advanced", icon: Icons.school),
  Keyword(name: "Expert", icon: Icons.explore),
  Keyword(name: "Master", icon: Icons.emoji_events),
  Keyword(name: "Guru", icon: Icons.lightbulb),
];

class Level extends StatefulWidget {
  final String topicName;
  final List<Question> typeOfTopic;

  const Level({
    super.key,
    required this.topicName,
    required this.typeOfTopic,
  });

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: TextSpan(
              children: [
                for (var i = 0; i < widget.topicName.length; i++) ...[
                  TextSpan(
                    text: widget.topicName[i],
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 30 + i.toDouble(),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ]
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Padding(
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
                child: Image.asset(
                  widget.topicName == "English"
                      ? "assets/english.png"
                      : widget.topicName == "Urdu"
                          ? "assets/urdu.png"
                          : widget.topicName == "Bengali"
                              ? "assets/bengali.png"
                              : widget.topicName == "German"
                                  ? "assets/german.png"
                                  : widget.topicName == "Hindi"
                                      ? "assets/hindi.png"
                                      : widget.topicName == "sindhi"
                                          ? "assets/sind.png"
                                          : "assets/punjabi.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.topicName} ",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      for (var i = 0; i < "Learning!!!".length; i++) ...[
                        TextSpan(
                          text: "Learning!!!"[i],
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
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
                itemCount: keywordsList.length,
                itemBuilder: (context, index) {
                  final keyword = keywordsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCard(
                            typeOfTopic: widget.typeOfTopic,
                            topicName: widget.topicName,
                          ),
                        ),
                      );
                      print(keyword.name);
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
                            // Icon(
                            //   keyword.icon,
                            //   color: Colors.white,
                            //   size: 55,
                            // ),
                            Image.asset(
                                cacheHeight: 100,
                                "assets/${keyword.name.toLowerCase()}.png"),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              keyword.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
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
      ),
    );
  }
}
