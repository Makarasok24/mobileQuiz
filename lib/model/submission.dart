import 'package:quizapplication/model/quiz.dart';

class Answer {
  Question question;
  String selectAnswer;

  Answer(this.selectAnswer, this.question);

  bool isCorrect() {
    return selectAnswer.contains(question.goodAnswer) &&
        question.goodAnswer.contains(selectAnswer);
  }
}

// class Submission
class Submission {

  List<Answer> answers = [];

  //calculate score
  int getScore() {
    int totalScore = 0;

    for (var answer in answers) {
      if (answer.isCorrect()) {
        totalScore++;
      }
    }

    return totalScore;
  }

  //add answer
  void addAnswer(Question questions, String answer) {
    answers.add(Answer(answer, questions));
  }

  // get answer
  Answer? getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.question == question) {
        return answer;
      }
    }
    return null;
  }

  // remove Answer
  void removeAnswers() {
    answers.clear();
  }
}
