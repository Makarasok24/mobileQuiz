import 'package:flutter/material.dart';
import 'package:quizapplication/model/submission.dart';
import 'package:quizapplication/screens/question_screen.dart';
import 'package:quizapplication/screens/result_screen.dart';
import 'package:quizapplication/screens/welcome_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState {notStarted,started,finished}

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Submission submission = Submission();
  QuizState _currentState = QuizState.notStarted;
  int currenQuestion = 0;
  void startQuiz(){
    setState(() {
      _currentState = QuizState.started;
      currenQuestion = 0;
    });
  }

  void finished(String selectAnswer){
    setState(() {
      // _currentState = QuizState.finished;
      submission.addAnswer(widget.quiz.questions[currenQuestion], selectAnswer);
      if(currenQuestion < widget.quiz.questions.length - 1){
        currenQuestion++;
      }else{
        _currentState = QuizState.finished;
      }
    });
  }

  void restart(){
    setState(() {
      _currentState = QuizState.notStarted;
      submission.removeAnswers();
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: _currentState == QuizState.notStarted 
        ? WelcomeScreen(isStarted: startQuiz,quizTitle:widget.quiz.title)
        : _currentState == QuizState.started
        ? QuestionScreen(
          onTap: (selectAnswer){
            finished(selectAnswer);
          },
          question: widget.quiz.questions[currenQuestion])
        : ResultScreen(onRestart: restart,submission: submission,quiz:widget.quiz),
      ),
    );
  }
}
