import 'dart:io';
import 'package:dart_sentiment/dart_sentiment.dart';

class SentimentAnalyzer {
  final Sentiment sentiment = Sentiment();

  // Method to analyze sentiment
  String analyzeSentiment(String text) {
    final result = sentiment.analysis(text);
    int score = result['score'] ?? 0; // Get the sentiment score

    if (score > 0) {
      return 'Positive (Score: $score)';
    } else if (score < 0) {
      return 'Negative (Score: $score)';
    } else {
      return 'Neutral (Score: $score)';
    }
  }

  // Method to load and analyze input text
  void loadAnalyzer(String inputText) {
    String result = analyzeSentiment(inputText);
    print('Text: "$inputText" => Sentiment: $result');
  }
}

void main() {
  SentimentAnalyzer analyzer = SentimentAnalyzer();

  print('Enter your text for sentiment analysis:');
  String inputText = stdin.readLineSync() ?? '';

  // Call loadAnalyzer with the input text
  analyzer.loadAnalyzer(inputText);
}