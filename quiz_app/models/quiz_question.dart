class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex; // Add this line

  QuizQuestion(this.question, this.options, this.correctAnswerIndex); // Update constructor
}