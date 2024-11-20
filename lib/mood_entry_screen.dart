/*import 'package:flutter/material.dart';

class MoodEntryScreen extends StatefulWidget {
  @override
  _MoodEntryScreenState createState() => _MoodEntryScreenState();
}

class _MoodEntryScreenState extends State<MoodEntryScreen> {
  final TextEditingController _notesController = TextEditingController();
  double _moodScore = 5.0; // Default mood score

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _saveMoodEntry() {
    // Save to Firebase or local storage
    // Example: save to Firebase with score, timestamp, and notes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Mood Entry")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Mood Score: ${_moodScore.toInt()}"),
            Slider(
              min: 0,
              max: 10,
              value: _moodScore,
              divisions: 10,
              label: _moodScore.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _moodScore = value;
                });
              },
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: "Notes (Optional)"),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMoodEntry,
              child: Text("Save Entry"),
            ),
          ],
        ),
      ),
    );
  }
}*/