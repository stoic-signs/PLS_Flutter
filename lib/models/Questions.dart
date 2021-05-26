class Question {
  final int id;
  final String question;
  final Map<int, String> options;

  factory Question.fromJson(Map question) {
    return Question(
      id: question['qid'],
      question: question['question'],
      options: question['options'],
      // answer: question['answer_index'],
    );
  }
  Question({this.id, this.question, this.options});
}

