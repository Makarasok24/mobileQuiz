import 'package:flutter/material.dart';
import 'package:quizapplication/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.isStarted,required this.quizTitle});

  final VoidCallback isStarted;
  final String quizTitle;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/quiz-logo.png",
            width: 400,
          ),
          const SizedBox(height: 20),
          Text(
            quizTitle,
            style: const TextStyle(
              fontSize: 40, 
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20,),
          AppButton(
            "Start Quiz",
            onTap: isStarted,
            icon: Icons.arrow_right_alt_rounded,
          )
        ],
      ),
    );
  }
}
 
