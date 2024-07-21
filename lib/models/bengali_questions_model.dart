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
    text: "What is the Bengali translation for the word 'conundrum'?",
    options: [
      const Option(text: "ধাঁধা", isCorrect: true),
      const Option(text: "সমস্যা", isCorrect: false),
      const Option(text: "উত্তর", isCorrect: false),
      const Option(text: "প্রশ্ন", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Option(text: "ধাঁধা", isCorrect: true),
  ),
  Question(
    text: "How do you say 'Good luck' in Bengali?",
    options: [
      const Option(text: "শুভ কামনা", isCorrect: true),
      const Option(text: "শুভ সকাল", isCorrect: false),
      const Option(text: "শুভ রাত্রি", isCorrect: false),
      const Option(text: "শুভ বিকাল", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const Option(text: "শুভ কামনা", isCorrect: true),
  ),
  Question(
    text: "What is the Bengali term for 'meticulous'?",
    options: [
      const Option(text: "খুঁতখুঁতে", isCorrect: true),
      const Option(text: "নিপুণ", isCorrect: false),
      const Option(text: "দক্ষ", isCorrect: false),
      const Option(text: "অমনোযোগী", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Option(text: "খুঁতখুঁতে", isCorrect: true),
  ),
  Question(
    text: "Translate 'compassion' into Bengali.",
    options: [
      const Option(text: "সহানুভূতি", isCorrect: true),
      const Option(text: "দয়া", isCorrect: false),
      const Option(text: "অনুভূতি", isCorrect: false),
      const Option(text: "স্নেহ", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Option(text: "সহানুভূতি", isCorrect: true),
  ),
  Question(
    text:
        "What is the Bengali equivalent of the phrase 'Out of sight, out of mind'?",
    options: [
      const Option(text: "চোখের আড়াল হলে মনও আড়াল হয়", isCorrect: true),
      const Option(text: "চোখে না দেখলে মনেও আসে না", isCorrect: false),
      const Option(text: "দূরে থাকলে ভুলে যাওয়া যায়", isCorrect: false),
      const Option(text: "আড়াল হলে ভুলে যাওয়া যায়", isCorrect: false),
    ],
    id: 4,
    correctAnswer:
        const Option(text: "চোখের আড়াল হলে মনও আড়াল হয়", isCorrect: true),
  ),
  Question(
    text: "How do you say 'perseverance' in Bengali?",
    options: [
      const Option(text: "অধ্যবসায়", isCorrect: true),
      const Option(text: "ধৈর্য", isCorrect: false),
      const Option(text: "পরিশ্রম", isCorrect: false),
      const Option(text: "অক্লান্ত", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const Option(text: "অধ্যবসায়", isCorrect: true),
  ),
  Question(
    text: "What is the Bengali translation for 'serendipity'?",
    options: [
      const Option(text: "সৌভাগ্য", isCorrect: false),
      const Option(text: "দৈবক্রমে সৌভাগ্য", isCorrect: true),
      const Option(text: "আশীর্বাদ", isCorrect: false),
      const Option(text: "অপ্রত্যাশিত সৌভাগ্য", isCorrect: false),
    ],
    id: 6,
    correctAnswer: const Option(text: "দৈবক্রমে সৌভাগ্য", isCorrect: true),
  ),
  Question(
    text: "How do you express 'camaraderie' in Bengali?",
    options: [
      const Option(text: "বন্ধুত্ব", isCorrect: true),
      const Option(text: "সহানুভূতি", isCorrect: false),
      const Option(text: "সহযোগিতা", isCorrect: false),
      const Option(text: "সম্প্রীতি", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Option(text: "বন্ধুত্ব", isCorrect: true),
  ),
  Question(
    text: "Translate 'ephemeral' into Bengali.",
    options: [
      const Option(text: "ক্ষণস্থায়ী", isCorrect: true),
      const Option(text: "স্থায়ী", isCorrect: false),
      const Option(text: "দীর্ঘস্থায়ী", isCorrect: false),
      const Option(text: "অনন্ত", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const Option(text: "ক্ষণস্থায়ী", isCorrect: true),
  ),
  Question(
    text: "What is the Bengali word for 'elucidate'?",
    options: [
      const Option(text: "ব্যাখ্যা করা", isCorrect: true),
      const Option(text: "বোঝানো", isCorrect: false),
      const Option(text: "প্রমাণ করা", isCorrect: false),
      const Option(text: "পরিষ্কার করা", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const Option(text: "ব্যাখ্যা করা", isCorrect: true),
  ),
  Question(
    text: "How do you say 'courageous' in Bengali?",
    options: [
      const Option(text: "সাহসী", isCorrect: true),
      const Option(text: "ভীতু", isCorrect: false),
      const Option(text: "দুঃসাহসী", isCorrect: false),
      const Option(text: "নির্ভীক", isCorrect: false),
    ],
    id: 10,
    correctAnswer: const Option(text: "সাহসী", isCorrect: true),
  ),
  Question(
    text: "Translate 'integrity' into Bengali.",
    options: [
      const Option(text: "অখণ্ডতা", isCorrect: true),
      const Option(text: "সততা", isCorrect: false),
      const Option(text: "শুদ্ধতা", isCorrect: false),
      const Option(text: "বিশ্বস্ততা", isCorrect: false),
    ],
    id: 11,
    correctAnswer: const Option(text: "অখণ্ডতা", isCorrect: true),
  ),
  Question(
    text: "What is the Bengali term for 'exuberant'?",
    options: [
      const Option(text: "উচ্ছ্বসিত", isCorrect: true),
      const Option(text: "খুশি", isCorrect: false),
      const Option(text: "উৎসাহী", isCorrect: false),
      const Option(text: "প্রাণবন্ত", isCorrect: false),
    ],
    id: 12,
    correctAnswer: const Option(text: "উচ্ছ্বসিত", isCorrect: true),
  ),
  Question(
    text: "How do you express 'melancholy' in Bengali?",
    options: [
      const Option(text: "বিষাদ", isCorrect: true),
      const Option(text: "আনন্দ", isCorrect: false),
      const Option(text: "উদাস", isCorrect: false),
      const Option(text: "সুখী", isCorrect: false),
    ],
    id: 13,
    correctAnswer: const Option(text: "বিষাদ", isCorrect: true),
  ),
  Question(
    text: "What is the Bengali word for 'intricate'?",
    options: [
      const Option(text: "জটিল", isCorrect: true),
      const Option(text: "সহজ", isCorrect: false),
      const Option(text: "সরল", isCorrect: false),
      const Option(text: "বাঁধা", isCorrect: false),
    ],
    id: 14,
    correctAnswer: const Option(text: "জটিল", isCorrect: true),
  ),
  Question(
    text: "Translate 'gratitude' into Bengali.",
    options: [
      const Option(text: "কৃতজ্ঞতা", isCorrect: true),
      const Option(text: "প্রশংসা", isCorrect: false),
      const Option(text: "আনন্দ", isCorrect: false),
      const Option(text: "শুভেচ্ছা", isCorrect: false),
    ],
    id: 15,
    correctAnswer: const Option(text: "কৃতজ্ঞতা", isCorrect: true),
  ),
];
