/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveMoodEntry(List<String?> answers, double normalizedScore, String notes) async {
  CollectionReference moods = FirebaseFirestore.instance.collection('moods');
  
  // Get the current user's ID
  String userId = FirebaseAuth.instance.currentUser!.uid;

  await moods.add({
    'userId': userId, // Store user ID with the mood entry
    'answers': answers,
    'normalizedScore': normalizedScore,
    'timestamp': FieldValue.serverTimestamp(),
    'notes': notes,
  });
}*/
// mood_service.dart

