import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:quiz_app/models/bengali_questions_model.dart';
import 'package:quiz_app/views/quiz_pages/quiz_screen.dart';
import 'package:quiz_app/widgets/flash_card_widget.dart';
import 'package:quiz_app/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class NewCard extends StatefulWidget {
  final String topicName;
  final List<Question> typeOfTopic;

  const NewCard({
    super.key,
    required this.topicName,
    required this.typeOfTopic,
  });

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color cardColor = Color(0xFF4993FA);

    List<Question> randomQuestionsMap =
        getRandomQuestionsAndOptions(widget.typeOfTopic, 4);
    List<Question> randomQuestions = randomQuestionsMap.toList();
    List<Question> randomOptions = randomQuestionsMap.toList();

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(right: 18.0),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                        weight: 10,
                      ),
                    ),
                    MyProgressIndicator(
                      questionlenght: randomQuestions,
                      optionsList: randomOptions,
                      topicType: widget.topicName,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.60,
                child: AppinioSwiper(
                  // padding: const EdgeInsets.all(10),

                  loop: true,
                  backgroundCardCount: 2,
                  swipeOptions: const SwipeOptions.all(),
                  allowUnlimitedUnSwipe: true,
                  controller: controller,

                  onUnSwipe: _unswipe,

                  onSwipeBegin:
                      (int index, int data, SwiperActivity direction) {
                    setState(() {});
                  },
                  onEnd: _onEnd,
                  cardCount: randomQuestions.length,
                  cardBuilder: (BuildContext context, int index) {
                    var cardIndex = randomQuestions[index];
                    return FlipCardsWidget(
                      bgColor: cardColor,
                      cardsLenght: randomQuestions.length,
                      currentIndex: index + 1,
                      answer: cardIndex.correctAnswer.text,
                      question: cardIndex.text,
                      currentTopic: widget.topicName,
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardColor),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.85, 30),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    onPressed: () => controller.unswipe(),
                    child: const Text(
                      "Reorder Cards",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardColor),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.85, 30),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            questionlenght: randomQuestions,
                            optionsList: randomOptions,
                            topicType: widget.topicName,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _unswipe(SwiperActivity activity) {
    if (activity.end!.isFinite) {
      print("SUCCESS: card was unswiped");
    } else {
      print("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    setState(() {});
    print("end reached!");
  }
}

List<Question> getRandomQuestionsAndOptions(
    List<Question> allQuestions, int count) {
  final randomQuestions = <Question>{};
  final List<Question> selectedQuestions = [];
  final random = Random();

  if (count >= allQuestions.length) {
    count = allQuestions.length;
  }

  while (randomQuestions.length < count) {
    final randomIndex = random.nextInt(allQuestions.length);
    final selectedQuestion = allQuestions[randomIndex];

    if (!randomQuestions.contains(selectedQuestion)) {
      randomQuestions.add(selectedQuestion);
      selectedQuestions.add(selectedQuestion);
    }
  }

  return selectedQuestions;
}
