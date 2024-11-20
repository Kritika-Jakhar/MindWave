import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  final String question;
  final Function(String) onNext;
  final int questionIndex;
  final bool isLastQuestion; // Add a flag to determine if it's the last question

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.onNext,
    required this.questionIndex,
    required this.isLastQuestion, // Pass the flag
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of colors for each question
    List<Color> colors = [
      Color(0xFF80B4AB), // Color for question 1
      Color(0xFFEAD3C4), // Color for question 2
      Color(0xFFD5A6BD), // Color for question 3
      Color(0xFFF4C300), // Color for question 4
      Color(0xFFC6E1F0), // Color for question 5
    ];

    // TextEditingController to manage the text field
    final TextEditingController answerController = TextEditingController();

    return Scaffold(
      backgroundColor: colors[questionIndex],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: answerController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Answer',
                ),
                onSubmitted: (answer) {
                  onNext(answer);
                  answerController.clear();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final answer = answerController.text;
                  if (answer.isNotEmpty) {
                    onNext(answer);
                    answerController.clear();

                    // Check if it's the last question
                    if (isLastQuestion) {
                      // Handle the submission of answers, for example:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Quiz submitted!")),
                      );
                      // Optionally, navigate to a summary screen or do something else
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter your answer")),
                    );
                  }
                },
                child: Text(isLastQuestion ? 'Submit' : 'Next Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    
      
 