class Question {
  final int id;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Option correctAnswer;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
    required this.id,
    required this.correctAnswer,
  });

  Question copyWith() {
    return Question(
      id: id,
      text: text,
      options: options
          .map((option) =>
              Option(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedOption: selectedOption,
      correctAnswer: correctAnswer,
    );
  }
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final bengaliQuestionsList = [
  Question(
    text: "আপেল এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "আপেল", isCorrect: true),
      const Option(text: "কলা", isCorrect: false),
      const Option(text: "চেরি", isCorrect: false),
      const Option(text: "আঙ্গুর", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "আপেল", isCorrect: true),
  ),
  Question(
    text: "সুপ্রভাত এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "শুভরাত্রি", isCorrect: false),
      const Option(text: "সুপ্রভাত", isCorrect: true),
      const Option(text: "শুভসন্ধ্যা", isCorrect: false),
      const Option(text: "শুভদিন", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const Option(text: "সুপ্রভাত", isCorrect: true),
  ),
  Question(
    text: "ধন্যবাদ এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "অনুগ্রহ", isCorrect: false),
      const Option(text: "মাফ করবেন", isCorrect: false),
      const Option(text: "ধন্যবাদ", isCorrect: true),
      const Option(text: "নমস্কার", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Option(text: "ধন্যবাদ", isCorrect: true),
  ),
  Question(
    text: "বই এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "চেয়ার", isCorrect: false),
      const Option(text: "বই", isCorrect: true),
      const Option(text: "টেবিল", isCorrect: false),
      const Option(text: "জানালা", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Option(text: "বই", isCorrect: true),
  ),
  Question(
    text: "আপনি কেমন আছেন এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "আপনি কেমন আছেন?", isCorrect: true),
      const Option(text: "আপনি কি করছেন?", isCorrect: false),
      const Option(text: "আপনি কোথায় আছেন?", isCorrect: false),
      const Option(text: "আপনি কবে আসবেন?", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const Option(text: "আপনি কেমন আছেন?", isCorrect: true),
  ),
  Question(
    text: "বিদায় এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "নমস্কার", isCorrect: false),
      const Option(text: "শুভসন্ধ্যা", isCorrect: false),
      const Option(text: "বিদায়", isCorrect: true),
      const Option(text: "ধন্যবাদ", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const Option(text: "বিদায়", isCorrect: true),
  ),
  Question(
    text: "গরম এর বিপরীত কী?",
    options: [
      const Option(text: "ঠান্ডা", isCorrect: true),
      const Option(text: "গরম", isCorrect: false),
      const Option(text: "শুকনো", isCorrect: false),
      const Option(text: "ভেজা", isCorrect: false),
    ],
    id: 6,
    correctAnswer: const Option(text: "ঠান্ডা", isCorrect: true),
  ),
  Question(
    text: "শিশু এর বহুবচন কী?",
    options: [
      const Option(text: "শিশু", isCorrect: false),
      const Option(text: "শিশুরা", isCorrect: true),
      const Option(text: "শিশুদের", isCorrect: false),
      const Option(text: "শিশুদেরকে", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Option(text: "শিশুরা", isCorrect: true),
  ),
  Question(
    text: "স্কুল এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "স্কুল", isCorrect: true),
      const Option(text: "বাড়ি", isCorrect: false),
      const Option(text: "গাড়ি", isCorrect: false),
      const Option(text: "বাগান", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const Option(text: "স্কুল", isCorrect: true),
  ),
  Question(
    text: "অনুগ্রহ এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "ধন্যবাদ", isCorrect: false),
      const Option(text: "মাফ করবেন", isCorrect: false),
      const Option(text: "অনুগ্রহ", isCorrect: true),
      const Option(text: "নমস্কার", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const Option(text: "অনুগ্রহ", isCorrect: true),
  ),
  Question(
    text: "জল এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "আগুন", isCorrect: false),
      const Option(text: "বাতাস", isCorrect: false),
      const Option(text: "জল", isCorrect: true),
      const Option(text: "পৃথিবী", isCorrect: false),
    ],
    id: 10,
    correctAnswer: const Option(text: "জল", isCorrect: true),
  ),
  Question(
    text: "খেলা এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "অধ্যয়ন", isCorrect: false),
      const Option(text: "খেলা", isCorrect: true),
      const Option(text: "চাকরি", isCorrect: false),
      const Option(text: "খোলামেলা", isCorrect: false),
    ],
    id: 11,
    correctAnswer: const Option(text: "খেলা", isCorrect: true),
  ),
  Question(
    text: "খোলামেলা এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "খোলামেলা", isCorrect: true),
      const Option(text: "খেলা", isCorrect: false),
      const Option(text: "অধ্যয়ন", isCorrect: false),
      const Option(text: "চাকরি", isCorrect: false),
    ],
    id: 12,
    correctAnswer: const Option(text: "খোলামেলা", isCorrect: true),
  ),
  Question(
    text: "বিপরীত এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "এক", isCorrect: false),
      const Option(text: "বিপরীত", isCorrect: true),
      const Option(text: "সমান", isCorrect: false),
      const Option(text: "অদম্য", isCorrect: false),
    ],
    id: 13,
    correctAnswer: const Option(text: "বিপরীত", isCorrect: true),
  ),
  Question(
    text: "শুভরাত্রি এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "শুভরাত্রি", isCorrect: true),
      const Option(text: "সুপ্রভাত", isCorrect: false),
      const Option(text: "শুভদিন", isCorrect: false),
      const Option(text: "শুভসন্ধ্যা", isCorrect: false),
    ],
    id: 14,
    correctAnswer: const Option(text: "শুভরাত্রি", isCorrect: true),
  ),
  Question(
    text: "গরম এর বাংলা অর্থ কী?",
    options: [
      const Option(text: "গরম", isCorrect: true),
      const Option(text: "ঠান্ডা", isCorrect: false),
      const Option(text: "শুকনো", isCorrect: false),
      const Option(text: "ভেজা", isCorrect: false),
    ],
    id: 15,
    correctAnswer: const Option(text: "গরম", isCorrect: true),
  ),
];
