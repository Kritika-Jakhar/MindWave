/*import 'package:flutter/material.dart';
import 'package:mood_tracker/suggested_activities_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultScreen extends StatefulWidget {
  final List<String?> answers; // List of answers
  final List<int> sentimentScores; // List of sentiment scores

  ResultScreen({required this.answers, required this.sentimentScores});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController notesController = TextEditingController();

  Future<void> saveMoodEntry(List<String?> answers, double normalizedScore, String notes) async {
    CollectionReference moods = FirebaseFirestore.instance.collection('moods');

    await moods.add({
      'answers': answers,
      'sentimentScores': widget.sentimentScores,
      'normalizedScore': normalizedScore,
      'timestamp': FieldValue.serverTimestamp(),
      'notes': notes, // Save actual user input for notes
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalScore = widget.sentimentScores.reduce((a, b) => a + b).toDouble();
    double averageScore = totalScore / widget.sentimentScores.length;
    double normalizedScore = (averageScore + 5) * 10 / 10;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB),
              Color(0xFFEAD3C4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.answers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('Q${index + 1}: ${widget.answers[index]}', style: TextStyle(color: Colors.black)),
                        subtitle: Text('Sentiment Score: ${widget.sentimentScores[index]}', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overall Mood Score:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '${normalizedScore.toStringAsFixed(2)} / 10',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  labelText: 'Add a note about your mood',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  saveMoodEntry(widget.answers, normalizedScore, notesController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedActivitiesScreen(score: normalizedScore)),
                  );
                },
                child: Text('Save Mood and View Suggested Activities'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:mood_tracker/suggested_activities_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class ResultScreen extends StatelessWidget {
  final List<String?> answers; // List of answers
  final List<int> sentimentScores; // List of sentiment scores

  ResultScreen({required this.answers, required this.sentimentScores});

  Future<void> saveMoodScore() async {
    CollectionReference moods = FirebaseFirestore.instance.collection('moods');

    await moods.add({
      'answers': answers,
      'sentimentScores': sentimentScores,
      'normalizedScore': (sentimentScores.reduce((a, b) => a + b) / sentimentScores.length + 5) * 10 / 10,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalScore = sentimentScores.reduce((a, b) => a + b).toDouble();
    double averageScore = totalScore / sentimentScores.length;
    double normalizedScore = (averageScore + 5) * 10 / 10;

    // Save mood score here
    saveMoodScore();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Start color
              Color(0xFFEAD3C4), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('Q${index + 1}: ${answers[index]}', style: TextStyle(color: Colors.black)),
                        subtitle: Text('Sentiment Score: ${sentimentScores[index]}', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overall Mood Score:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '${normalizedScore.toStringAsFixed(2)} / 10',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedActivitiesScreen(score: normalizedScore)),
                  );
                },
                child: Text(
                  'View Suggested Activities According to your Mood',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:mood_tracker/suggested_activities_screen.dart';
//import 'package:mood_tracker/MoodEntry.dart';

class ResultScreen extends StatelessWidget {
  final List<String?> answers; // List of answers
  final List<int> sentimentScores; // List of sentiment scores
  //final List<MoodEntry> moodHistory; // Added mood history

  ResultScreen({required this.answers, required this.sentimentScores});

  @override
  Widget build(BuildContext context) {
    // Calculate the total score based on sentiment scores
    double totalScore = sentimentScores.reduce((a, b) => a + b).toDouble();
    // Calculate average score (assuming 5 questions)
    double averageScore = totalScore / sentimentScores.length;

    // Normalize to scale of 1-10
    double normalizedScore = (averageScore + 5) * 10 / 10; // Assuming score is between -5 and 5

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Start color
              Color(0xFFEAD3C4), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8), // Card background
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('Q${index + 1}: ${answers[index]}', style: TextStyle(color: Colors.black)),
                        subtitle: Text('Sentiment Score: ${sentimentScores[index]}', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overall Mood Score:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '${normalizedScore.toStringAsFixed(2)} / 10', // Display normalized score
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedActivitiesScreen(score: normalizedScore)),
                  );
                },
                child: Text(
                  'View Suggested Activities According to your Mood',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:mood_tracker/suggested_activities_screen.dart';
import 'package:mood_tracker/mood_chart_screen.dart'; // Import the MoodChartScreen
import 'package:mood_tracker/MoodEntry.dart';

class ResultScreen extends StatelessWidget {
  final List<String?> answers; // List of answers
  final List<int> sentimentScores; // List of sentiment scores
  final List<MoodEntry> moodHistory; // Added mood history

  ResultScreen({required this.answers, required this.sentimentScores, required this.moodHistory});

  @override
  Widget build(BuildContext context) {
    // Calculate the total score based on sentiment scores
    double totalScore = sentimentScores.reduce((a, b) => a + b).toDouble();
    // Calculate average score (assuming 5 questions)
    double averageScore = totalScore / sentimentScores.length;

    // Normalize to scale of 1-10
    double normalizedScore = (averageScore + 5) * 10 / 10; // Assuming score is between -5 and 5

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Start color
              Color(0xFFEAD3C4), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8), // Card background
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('Q${index + 1}: ${answers[index]}', style: TextStyle(color: Colors.black)),
                        subtitle: Text('Sentiment Score: ${sentimentScores[index]}', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overall Mood Score:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '${normalizedScore.toStringAsFixed(2)} / 10', // Display normalized score
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedActivitiesScreen(score: normalizedScore, moodHistory: moodHistory)), // Pass moodHistory to SuggestedActivitiesScreen
                  );
                },
                child: Text(
                  'View Suggested Activities According to your Mood',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoodChartScreen(moodHistory: moodHistory)), // Navigate to MoodChartScreen
                  );
                },
                child: Text(
                  'View Your Mood History Chart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:mood_tracker/suggested_activities_screen.dart';
import 'package:mood_tracker/mood_chart_screen.dart'; // Import the MoodChartScreen
import 'package:mood_tracker/MoodEntry.dart';

class ResultScreen extends StatelessWidget {
  final List<String?> answers; // List of answers
  final List<int> sentimentScores; // List of sentiment scores
  final List<MoodEntry> moodHistory; // Added mood history

  ResultScreen({required this.answers, required this.sentimentScores, required this.moodHistory});

  @override
  Widget build(BuildContext context) {
    // Calculate the total score based on sentiment scores
    double totalScore = sentimentScores.reduce((a, b) => a + b).toDouble();
    // Calculate average score (assuming 5 questions)
    double averageScore = totalScore / sentimentScores.length;

    // Normalize to scale of 1-10
    double normalizedScore = (averageScore + 5) * 10 / 10; // Assuming score is between -5 and 5

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Start color
              Color(0xFFEAD3C4), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Answers:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8), // Card background
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('Q${index + 1}: ${answers[index]}', style: TextStyle(color: Colors.black)),
                        subtitle: Text('Sentiment Score: ${sentimentScores[index]}', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Overall Mood Score:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                '${normalizedScore.toStringAsFixed(2)} / 10', // Display normalized score
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedActivitiesScreen(score: normalizedScore, moodHistory: moodHistory)), // Pass moodHistory to SuggestedActivitiesScreen
                  );
                },
                child: Text(
                  'View Suggested Activities According to your Mood',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoodChartScreen(moodHistory: moodHistory)), // Navigate to MoodChartScreen
                  );
                },
                child: Text(
                  'View Your Mood History Chart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/