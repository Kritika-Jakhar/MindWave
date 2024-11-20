import 'dart:async';
//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/login_screen.dart';
import 'package:mood_tracker/question_screen.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:mood_tracker/result_screen.dart';
// import 'package:mood_tracker/MoodEntry.dart'; // Uncomment if MoodEntry is needed

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker App',
      theme: ThemeData(primaryColor: Color(0xFF80B4AB)),
      home: LoginScreen(), // Start with the Login Screen
    );
  }
}

class MoodTrackerQuiz extends StatefulWidget {
  @override
  _MoodTrackerQuizState createState() => _MoodTrackerQuizState();
}

class _MoodTrackerQuizState extends State<MoodTrackerQuiz> {
  int currentQuestionIndex = 0;
  List<String?> answers = List.filled(5, null); // Assuming 5 questions
  List<int> sentimentScores = []; // Store sentiment scores
  final List<String> questions = [
    "What's been on your mind the most today?",
    "How would you rate your day so far?",
    "How would you describe your energy levels today?",
    "What's something you hope to accomplish by the end of the day?",
    "What are you looking forward to today or this week?",
  ];

  // Initialize the sentiment analysis object
  final Sentiment sentiment = Sentiment();

  @override

  String preprocessText(String text) {
    // Convert to lowercase for consistency
    text = text.toLowerCase();

    // Handle negations and common phrases
    if (text.contains("not ")) {
      if (text.contains("happy")) {
        text = text.replaceAll("not happy", "unhappy");
      } else if (text.contains("good")) {
        text = text.replaceAll("not good", "bad");
      } else if (text.contains("bad")) {
        text = text.replaceAll("not bad", "okay"); // Weakens the negative sentiment
      } else if (text.contains("sure")) {
        text = text.replaceAll("not sure", "neutral"); // Neutralize the sentiment
      }
    }

    // Handle intensifiers
    if (text.contains("very ")) {
      if (text.contains("low")) {
        text = text.replaceAll("very low", "very sad");
      } else if (text.contains("bad")) {
        text = text.replaceAll("very bad", "terrible");
      } else if (text.contains("good")) {
        text = text.replaceAll("very good", "excellent");
      }
    }

    return text;
  }

  void handleAnswer(String answer) {
    answers[currentQuestionIndex] = answer; // Save the answer

    // Preprocess the answer before sentiment analysis
    String processedAnswer = preprocessText(answer);
    
    // Perform sentiment analysis on the processed answer
    var sentimentAnalysis = sentiment.analysis(processedAnswer); // Use the analyze method
    int score = sentimentAnalysis['score'] ?? 0; // Safely get the score, default to 0 if not found
    sentimentScores.add(score); // Store the score

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Move to the next question
      });
    } else {
      // Handle completion and navigate to the result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            answers: answers,
            sentimentScores: sentimentScores,
          ),
        ),
      ).then((_) {
        // After returning from the ResultScreen, navigate to another screen if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker Quiz')),
      body: QuestionScreen(
        question: questions[currentQuestionIndex],
        onNext: handleAnswer,
        questionIndex: currentQuestionIndex,
        isLastQuestion: currentQuestionIndex == questions.length - 1,
      ),
    );
  }
}



/*import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/login_screen.dart';
import 'package:mood_tracker/question_screen.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:mood_tracker/result_screen.dart';
import 'package:mood_tracker/MoodEntry.dart'; // Import the MoodEntry model

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker App',
      theme: ThemeData(primaryColor: Color(0xFF80B4AB)),
      home: LoginScreen(), // Start with the Login Screen
    );
  }
}

class MoodTrackerQuiz extends StatefulWidget {
  @override
  _MoodTrackerQuizState createState() => _MoodTrackerQuizState();
}

class _MoodTrackerQuizState extends State<MoodTrackerQuiz> {
  int currentQuestionIndex = 0;
  List<String?> answers = List.filled(5, null); // Assuming 5 questions
  List<int> sentimentScores = []; // Store sentiment scores
  final List<MoodEntry> moodHistory = []; // Initialize mood history
  final List<String> questions = [
    "What's been on your mind the most today?",
    "How would you rate your day so far (you can describe like - Good, Excellent, Bad, Terrible, Okay, Neutral, etc)?",
    "How would you describe your energy levels today? (you can describe like - Very High, Very Low, Neutral, High, Low, etc)?",
    "What's something you hope to accomplish by the end of the day?",
    "What are you looking forward to today or this week?",
  ];

  // Initialize the sentiment analysis object
  final Sentiment sentiment = Sentiment();

  String preprocessText(String text) {
    // Convert to lowercase for consistency
    text = text.toLowerCase();

    // Handle negations and common phrases
    if (text.contains("not ")) {
      // Replace specific phrases
      if (text.contains("happy")) {
        text = text.replaceAll("not happy", "unhappy");
      } else if (text.contains("good")) {
        text = text.replaceAll("not good", "bad");
      } else if (text.contains("bad")) {
        text = text.replaceAll("not bad", "okay"); // Weakens the negative sentiment
      } else if (text.contains("sure")) {
        text = text.replaceAll("not sure", "neutral"); // Neutralize the sentiment
      }
    }

    // Handle intensifiers
    if (text.contains("very ")) {
      if (text.contains("low")) {
        text = text.replaceAll("very low", "very sad"); 
      } else if (text.contains("bad")) {
        text = text.replaceAll("very bad", "terrible");
      } else if (text.contains("good")) {
        text = text.replaceAll("very good", "excellent");
      }
    }

    return text;
  }

  void handleAnswer(String answer) {
    answers[currentQuestionIndex] = answer; // Save the answer

    // Preprocess the answer before sentiment analysis
    String processedAnswer = preprocessText(answer);
    
    // Perform sentiment analysis on the processed answer
    var sentimentAnalysis = sentiment.analysis(processedAnswer); // Use the analyze method
    int score = sentimentAnalysis['score'] ?? 0; // Safely get the score, default to 0 if not found
    sentimentScores.add(score); // Store the score

    // Create a new MoodEntry based on the current question and score
    moodHistory.add(MoodEntry(date: DateTime.now() , moodScore: score));

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Move to the next question
      });
    } else {
      // Handle completion and navigate to the result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            answers: answers,
            sentimentScores: sentimentScores,
            moodHistory: moodHistory, // Pass the mood history
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker Quiz')),
      body: QuestionScreen(
        question: questions[currentQuestionIndex],
        onNext: handleAnswer,
        questionIndex: currentQuestionIndex,
        isLastQuestion: currentQuestionIndex == questions.length - 1,
      ),
    );
  }
}*/


  // Initialize the sentiment analysis object
  /*final Sentiment sentiment = Sentiment();

  void handleAnswer(String answer) {
    answers[currentQuestionIndex] = answer; // Save the answer
    
    // Perform sentiment analysis on the answer
    var sentimentAnalysis = sentiment.analysis(answer);
    sentimentScores.add(sentimentAnalysis['score']); // Store the score

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Move to the next question
      });
    } else {
      // Handle completion and navigate to the result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            answers: answers,
            sentimentScores: sentimentScores,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker Quiz')),
      body: QuestionScreen(
        question: questions[currentQuestionIndex],
        onNext: handleAnswer,
        questionIndex: currentQuestionIndex,
        isLastQuestion: currentQuestionIndex == questions.length - 1,
      ),
    );
  }
}*/

  

// Initialize the sentiment analyzer


