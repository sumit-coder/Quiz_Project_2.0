class Question {
  final String id;
  final String question;
  final String currectAnswer;
  final int currectAnswerIndex;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.currectAnswer,
    required this.currectAnswerIndex,
    required this.options,
  });
}
