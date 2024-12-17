class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.correctAnswerIndex);

  final String text;
  final List<String> answers;
  final int correctAnswerIndex;

  // Get shuffled answers for randomizing the order
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  // Check if the selected answer is correct by index
  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }
}
