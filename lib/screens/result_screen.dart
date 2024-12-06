import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.userAnswers,
    required this.onQuizRestart,
  });

  final List<String> userAnswers;
  final void Function() onQuizRestart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': quizData[i].question,
        'user_answer': userAnswers[i],
        'correct_answer': quizData[i].option[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    print(summaryData);
    int score = summaryData.where((question) => question['user_answer'] == question['correct_answer']).length;
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answer $score out of ${quizData.length} correctly!',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Implement the summary widget',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          //* hints:
          Text(summaryData[0]['question'].toString()),
          Text(summaryData[3]['user_answer'].toString()),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            onPressed: onQuizRestart,
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text(
              'Restart Quiz',
            ),
            style: OutlinedButton.styleFrom(
              iconColor: Colors.white,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
