/*import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> saveMoodScore(String userId, int score, String mood) async {
  CollectionReference moods = FirebaseFirestore.instance.collection('moods');

  await moods.doc(userId).collection('moodEntries').add({
    'mood': mood, // You can use a mood string or description based on the score
    'score': score,
    'timestamp': FieldValue.serverTimestamp(),
  });
}*/
/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MoodHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood History"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('moods').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final moodEntries = snapshot.data!.docs;
          return ListView.builder(
            itemCount: moodEntries.length,
            itemBuilder: (context, index) {
              final moodEntry = moodEntries[index];
              return ListTile(
                title: Text("Mood Score: ${moodEntry['normalizedScore'].toStringAsFixed(1)}"),
                subtitle: Text("Notes: ${moodEntry['notes']}"),
                trailing: Text(
                  DateFormat('MM/dd/yyyy').format(moodEntry['timestamp'].toDate()),
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MoodHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user's ID
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mood History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('moods')
            .where('userId', isEqualTo: userId) // Filter by user ID
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final moodEntries = snapshot.data!.docs;
          return ListView.builder(
            itemCount: moodEntries.length,
            itemBuilder: (context, index) {
              final moodEntry = moodEntries[index];
              return ListTile(
                title: Text("Mood Score: ${moodEntry['normalizedScore'].toStringAsFixed(1)}"),
                subtitle: Text("Notes: ${moodEntry['notes']}"),
                trailing: Text(
                  DateFormat('MM/dd/yyyy').format(moodEntry['timestamp'].toDate()),
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MoodHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    // Check if user is logged in
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("Please log in to view your mood history."),
        ),
      );
    }

    String userId = user.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mood History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('moods')
            .where('userId', isEqualTo: userId) // Filter by user ID
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final moodEntries = snapshot.data!.docs;

          if (moodEntries.isEmpty) {
            return Center(child: Text("No mood entries found."));
          }

          return ListView.builder(
            itemCount: moodEntries.length,
            itemBuilder: (context, index) {
              final moodEntry = moodEntries[index];
              return ListTile(
                title: Text("Mood Score: ${moodEntry['normalizedScore'].toStringAsFixed(1)}"),
                subtitle: Text("Notes: ${moodEntry['notes']}"),
                trailing: Text(
                  DateFormat('MM/dd/yyyy').format(moodEntry['timestamp'].toDate()),
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}*/