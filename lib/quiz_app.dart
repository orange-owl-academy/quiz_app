import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_data.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? currentScreen;
  List<String> userAnswers = []; //*  Quiz_App(userAnswers) > QuestionScreen > Options(value) --> userAnswers.add(value);

  //* Sending this function as a parameter to Start Screen
  void switchScreen() {
    setState(() {
      currentScreen = QuestionScreen(onOptionSelected: _addAnswers);
    });
  }

  void restartQuiz() {
    userAnswers.clear();
    currentScreen = StartScreen(startQuiz: switchScreen);
    setState(() {});
  }

  void _addAnswers(String answer) {
    userAnswers.add(answer);
    print("### ${userAnswers.length} == ${quizData.length}");
    if (userAnswers.length == quizData.length) {
      currentScreen = ResultScreen(
        userAnswers: userAnswers,
        onQuizRestart: restartQuiz,
      ); //* shojib
      setState(() {}); //* nadim+2
    }
  }

  @override
  void initState() {
    currentScreen = StartScreen(startQuiz: switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 0, 158),
                Color.fromARGB(255, 75, 0, 125),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
