import 'package:flutter/material.dart';
import 'package:quizapplication/model/quiz.dart';

 
class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key,required this.onTap,required this.question});
  final Question question;
  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          Text(
            question.title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white
            ),
          ),
          const SizedBox(height: 20),
          ...question.possibleAnswers.map((answer) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed:() => onTap(answer), 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 20),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30)
                ),
                child: Text(answer),
              ),
            );
          })
        ],
      ),
    );
  }
}
 