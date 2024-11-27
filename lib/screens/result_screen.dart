import 'package:flutter/material.dart';
import 'package:quizapplication/model/quiz.dart';
import 'package:quizapplication/model/submission.dart';
import 'package:quizapplication/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.onRestart,required this.quiz,required this.submission});
  final VoidCallback onRestart;
  final Quiz quiz;
  final Submission submission;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You scored ${submission.getScore()} of ${quiz.questions.length} points!',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white
            ),
          ),
          const SizedBox(height: 20),
          ...quiz.questions.map((item) => Column(
            children: [
              Text(item.title),
              ...item.possibleAnswers.map((answers) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(answers==item.goodAnswer ? Icons.check_box_rounded: Icons.close,color: answers==item.goodAnswer ? Colors.green: Colors.red,),
                      Text(answers,
                        style: TextStyle(
                        color: submission.getAnswerFor(item)?.selectAnswer == answers && answers==item.goodAnswer ? Colors.green 
                        :submission.getAnswerFor(item)?.selectAnswer == answers && answers!=item.goodAnswer ? Colors.red
                        :Colors.black,
                        ),
                      )
                    ],
                  )
                ]
              ))
            ]
          )),
          const SizedBox(height: 20),
          AppButton(
            "Restart", 
            onTap: onRestart,
            icon: Icons.restart_alt_rounded,
          )
        ]
      ),
    );
  }
}
 