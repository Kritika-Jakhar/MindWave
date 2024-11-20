/*import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker/mood_service.dart';


class MoodEntry {
  final List<String?> answers; // Change to List<String> if answers cannot be null
  final double normalizedScore;
  final String notes;
  final Timestamp timestamp;

  MoodEntry({
    required this.answers,
    required this.normalizedScore,
    required this.notes,
    required this.timestamp,
  });
}
Future<List<MoodEntry>> getUserMoodEntries() async {
  String userId = FirebaseAuth.instance.currentUser!.uid; // Get the current user's ID
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('moods')
      .where('userId', isEqualTo: userId) // Filter by user ID
      .get();

  return querySnapshot.docs.map((doc) {
    return MoodEntry(
      answers: List<String?>.from(doc['answers']),
      normalizedScore: doc['normalizedScore'],
      notes: doc['notes'],
      timestamp: doc['timestamp'],
    );
  }).toList();
}*/