import 'package:quiz_app/models/bengali_questions_model.dart';
import 'package:quiz_app/models/english_questions_model.dart';
import 'package:quiz_app/models/german_questions_model.dart';
import 'package:quiz_app/models/hindi_questions_model.dart';
import 'package:quiz_app/models/punjabi_questions_model.dart';
import 'package:quiz_app/models/sindhi_questions_model.dart';
import 'package:quiz_app/models/urdu_questions_model.dart';
import 'package:flutter/cupertino.dart';

const Color cardColor = Color(0xFF4993FA);

class FlutterTopics {
  final int id;
  final String topicName;
  final IconData topicIcon;
  final Color topicColor;
  final List<Question> topicQuestions;

  FlutterTopics({
    required this.id,
    required this.topicColor,
    required this.topicIcon,
    required this.topicName,
    required this.topicQuestions,
  });
}

final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.book,
    topicName: "English",
    topicQuestions: englishQuestionsList,
  ),
  FlutterTopics(
    id: 1,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.bookmark,
    topicName: "German",
    topicQuestions: germanQuestionsList,
  ),
  FlutterTopics(
    id: 2,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.globe,
    topicName: "Urdu",
    topicQuestions: urduQuestionsList,
  ),
  FlutterTopics(
    id: 3,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.chat_bubble_text,
    topicName: "Hindi",
    topicQuestions: hindiQuestionsList,
  ),
  FlutterTopics(
    id: 4,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.textformat,
    topicName: "Bengali",
    topicQuestions: bengaliQuestionsList,
  ),
  FlutterTopics(
    id: 5,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.person_2,
    topicName: "Punjabi",
    topicQuestions: punjabiQuestionsListInUrdu,
  ),
  FlutterTopics(
    id: 6,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.book_circle,
    topicName: "sindhi",
    topicQuestions: sindhiQuestionsListInPakistanUrdu,
  ),
];
