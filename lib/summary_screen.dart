import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final List<String?> answers;

  const SummaryScreen({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Mood Tracker Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Question ${index + 1}'),
                    subtitle: Text(answers[index] ?? 'No answer provided'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to home or reset the quiz
                Navigator.pop(context); // You can pop to return to the previous screen or navigate to home
              },
              child: const Text('Go to Home'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Start the quiz again
                Navigator.pop(context); // Or navigate to the start of the quiz
              },
              child: const Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}