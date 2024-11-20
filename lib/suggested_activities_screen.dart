
/*import 'package:flutter/material.dart';
//import 'package:mood_tracker/MoodEntry.dart';
import 'package:mood_tracker/main.dart';


class SuggestedActivitiesScreen extends StatelessWidget {
  final double score; // Score from the result screen
  //final List<MoodEntry> moodHistory;

  SuggestedActivitiesScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    // Suggest activities based on the mood score
    List<String> activities = getSuggestedActivities(score);
    List<YogaExercise> yogaExercises = getYogaExercises(); // Get yoga exercises

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Activities'),
        backgroundColor: Color(0xFF80B4AB),
      ),
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
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Suggested Activities:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...activities.map((activity) => Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  activity,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )),
            SizedBox(height: 20),
            Text(
              'Yoga Exercises:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...yogaExercises.map((exercise) => Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      exercise.instruction,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  // Function to suggest activities based on the score
  List<String> getSuggestedActivities(double score) {
    if (score < 3) {
      return [
        'Go for a short walk to clear your mind',
        'Try some deep breathing or meditation exercises',
        'Listen to calming music or nature sounds',
        'Write your thoughts in a journal to express your feelings',
        'Take a break with a small creative activity like doodling',
      ];
    } else if (score >= 3 && score < 7) {
      return [
        'Spend some time outdoors to refresh your mind',
        'Catch up with a friend over a call or coffee',
        'Try a creative activity like drawing, painting, or writing',
        'Watch a light-hearted movie or series',
        'Read a chapter from a favorite book or start a new one',
      ];
    } else {
      return [
        'Celebrate your mood by planning something exciting!',
        'Engage in a hobby you love – cooking, painting, etc.',
        'Plan a small adventure, maybe a day trip or hike',
        'Treat yourself to a relaxing activity, like a spa or a movie night',
        'Enjoy some physical activity, like dancing or going to the gym',
      ];
    }
  }

  // Function to return a list of yoga exercises
  List<YogaExercise> getYogaExercises() {
    return [
      YogaExercise(
        name: "Child's Pose",
        instruction: "1. Kneel on the floor.\n2. Sit back on your heels.\n3. Reach your arms forward on the floor.\n4. Rest your forehead on the mat and breathe deeply.",
      ),
      YogaExercise(
        name: "Downward Dog",
        instruction: "1. Start on your hands and knees.\n2. Tuck your toes and lift your hips up.\n3. Keep your arms straight and press your heels towards the floor.\n4. Hold the pose and breathe.",
      ),
      YogaExercise(
        name: "Cat-Cow Stretch",
        instruction: "1. Start on your hands and knees.\n2. Inhale and arch your back (cow pose).\n3. Exhale and round your spine (cat pose).\n4. Repeat this sequence for a few breaths.",
      ),
      YogaExercise(
        name: "Cobra Pose",
        instruction: "1. Lie face down on the floor.\n2. Place your hands under your shoulders.\n3. Inhale and lift your chest off the ground.\n4. Keep your elbows slightly bent and hold the pose.",
      ),
      YogaExercise(
        name: "Tree Pose",
        instruction: "1. Stand tall and shift your weight to one leg.\n2. Place the other foot on the inner thigh of the standing leg.\n3. Bring your hands together in front of your chest or overhead.\n4. Hold the pose and focus on your balance.",
      ),
    ];
  }
}

// Class to define a YogaExercise
class YogaExercise {
  final String name;
  final String instruction;

  YogaExercise({required this.name, required this.instruction});
}*/


import 'package:flutter/material.dart';
// import 'package:mood_tracker/MoodEntry.dart';
import 'package:mood_tracker/main.dart';
import 'package:url_launcher/url_launcher.dart';

class SuggestedActivitiesScreen extends StatelessWidget {
  final double score; // Score from the result screen

  SuggestedActivitiesScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    // Suggest activities and playlists based on the mood score
    List<String> activities = getSuggestedActivities(score);
    List<YogaExercise> yogaExercises = getYogaExercises();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Activities'),
        backgroundColor: Color(0xFF80B4AB),
      ),
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
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Suggested Activities:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...activities.map((activity) => Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  activity,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )),
            SizedBox(height: 20),
            Text(
              'Mood Playlist:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      String playlistUrl = getPlaylistUrl(score, 'English');
                      launchUrl(Uri.parse(playlistUrl));
                    },
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'English Playlist',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      String playlistUrl = getPlaylistUrl(score, 'Hindi');
                      launchUrl(Uri.parse(playlistUrl));
                    },
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Hindi Playlist',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Yoga Exercises:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...yogaExercises.map((exercise) => Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      exercise.instruction,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  // Function to suggest activities based on the score
  List<String> getSuggestedActivities(double score) {
    if (score < 3) {
      return [
        'Go for a short walk to clear your mind',
        'Try some deep breathing or meditation exercises',
        'Listen to calming music or nature sounds',
        'Write your thoughts in a journal to express your feelings',
        'Take a break with a small creative activity like doodling',
      ];
    } else if (score >= 3 && score < 7) {
      return [
        'Spend some time outdoors to refresh your mind',
        'Catch up with a friend over a call or coffee',
        'Try a creative activity like drawing, painting, or writing',
        'Watch a light-hearted movie or series',
        'Read a chapter from a favorite book or start a new one',
      ];
    } else {
      return [
        'Celebrate your mood by planning something exciting!',
        'Engage in a hobby you love – cooking, painting, etc.',
        'Plan a small adventure, maybe a day trip or hike',
        'Treat yourself to a relaxing activity, like a spa or a movie night',
        'Enjoy some physical activity, like dancing or going to the gym',
      ];
    }
  }

  // Function to get the Spotify playlist URL based on score and language
  String getPlaylistUrl(double score, String language) {
    if (score < 3) {
      return language == 'English'
          ? 'https://open.spotify.com/playlist/0cj48sijCRDJ3Hatx1k1vJ?si=D1jWJ92sT0eXm2Z_tfC-QA&utm_source=copy-link'
          : 'https://open.spotify.com/playlist/1Dk9SeguLL5qTnjfyX5VnZ?si=8dnze9SkSxCUNGxtX-94UA&utm_source=copy-link';
    } else if (score >= 3 && score < 7) {
      return language == 'English'
          ? 'https://open.spotify.com/playlist/0B1cW8x7Mopg6Du5BJ4spM?si=8toH9SfbReON71aVEH0h5A&utm_source=copy-link'
          : 'https://open.spotify.com/playlist/28nepOOmS5ohmqSFKTdgSf?si=Ze1K6Bg8Q22Qnix70eNeMQ&utm_source=copy-link';
    } else {
      return language == 'English'
          ? 'https://open.spotify.com/playlist/3WYmyXrEqRL1UnV3ep13ie?si=dYMFLJ9ZS5aHPmIyEHtPYQ&utm_source=copy-link'
          : 'https://open.spotify.com/playlist/3mSm688yR6UeaAJNf93Ydr?si=RsZbU1gpR-2yxu9BirDnmg&utm_source=copy-link';
    }
  }

  // Function to return a list of yoga exercises
  List<YogaExercise> getYogaExercises() {
    return [
      YogaExercise(
        name: "Child's Pose",
        instruction: "1. Kneel on the floor.\n2. Sit back on your heels.\n3. Reach your arms forward on the floor.\n4. Rest your forehead on the mat and breathe deeply.",
      ),
      YogaExercise(
        name: "Downward Dog",
        instruction: "1. Start on your hands and knees.\n2. Tuck your toes and lift your hips up.\n3. Keep your arms straight and press your heels towards the floor.\n4. Hold the pose and breathe.",
      ),
      YogaExercise(
        name: "Cat-Cow Stretch",
        instruction: "1. Start on your hands and knees.\n2. Inhale and arch your back (cow pose).\n3. Exhale and round your spine (cat pose).\n4. Repeat this sequence for a few breaths.",
      ),
      YogaExercise(
        name: "Cobra Pose",
        instruction: "1. Lie face down on the floor.\n2. Place your hands under your shoulders.\n3. Inhale and lift your chest off the ground.\n4. Keep your elbows slightly bent and hold the pose.",
      ),
      YogaExercise(
        name: "Tree Pose",
        instruction: "1. Stand tall and shift your weight to one leg.\n2. Place the other foot on the inner thigh of the standing leg.\n3. Bring your hands together in front of your chest or overhead.\n4. Hold the pose and focus on your balance.",
      ),
    ];
  }
}

// Class to define a YogaExercise
class YogaExercise {
  final String name;
  final String instruction;

  YogaExercise({required this.name, required this.instruction});
}
          