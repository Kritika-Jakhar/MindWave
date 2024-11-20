/*import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mood_tracker/main.dart';

class WelcomeScreen extends StatelessWidget {
  final Function onStartQuiz;

  WelcomeScreen({Key? key, required this.onStartQuiz}) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4), // Optional background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MoodTrackerQuiz()),);
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen

class WelcomeScreen extends StatelessWidget {
  final Function onStartQuiz;

  WelcomeScreen({Key? key, required this.onStartQuiz}) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4), // Optional background color
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when menu icon is pressed
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: 'User Name', // Pass actual user name here
                      userEmail: 'user@example.com', // Pass actual user email here
                    ),
                  ),
                );
              },
            ),
            // Add more ListTiles here for other sections as needed
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoodTrackerQuiz()));
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen
import 'package:mood_tracker/auth/auth_service.dart'; // Import your AuthService

class WelcomeScreen extends StatelessWidget {
  final String userName; // User's name
  final String userEmail; // User's email
  final Function onStartQuiz;

  // Constructor to receive user information
  WelcomeScreen({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.onStartQuiz,
  }) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4),
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName, // Display the user's name
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    userEmail, // Display the user's email
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: userName, // Pass the actual user name here
                      userEmail: userEmail, // Pass the actual user email here
                    ),
                  ),
                );
              },
            ),
            // Add more ListTiles here for other sections as needed
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoodTrackerQuiz()));
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen
import 'package:mood_tracker/auth/auth_service.dart'; // Import your AuthService

class WelcomeScreen extends StatelessWidget {
  final String userName; // User's name
  final String userEmail; // User's email

  WelcomeScreen({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4),
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: userName,
                      userEmail: userEmail,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoodTrackerQuiz()));
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen

class WelcomeScreen extends StatelessWidget {
  final Function onStartQuiz;
  final String userName;  // Add userName parameter
  final String userEmail; // Add userEmail parameter

  WelcomeScreen({
    Key? key,
    required this.onStartQuiz,
    required this.userName,  // Initialize userName
    required this.userEmail, // Initialize userEmail
  }) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4), // Optional background color
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when menu icon is pressed
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: userName, // Use the passed userName
                      userEmail: userEmail, // Use the passed userEmail
                    ),
                  ),
                );
              },
            ),
            // Add more ListTiles here for other sections as needed
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    onStartQuiz(); // Call the onStartQuiz function
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

            
/*import 'package:flutter/material.dart';
import 'package:mood_tracker/question_screen.dart';
import 'dart:math';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen

class WelcomeScreen extends StatelessWidget {
  final Function onStartQuiz;
  final String userName;  // Add userName parameter
  final String userEmail; // Add userEmail parameter

  WelcomeScreen({
    Key? key,
    required this.onStartQuiz,
    required this.userName,  // Initialize userName
    required this.userEmail, // Initialize userEmail
  }) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4), // Optional background color
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when menu icon is pressed
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: userName, // Use the passed userName
                      userEmail: userEmail, // Use the passed userEmail
                    ),
                  ),
                );
              },
            ),
            // Add more ListTiles here for other sections as needed
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the MoodEntryScreen when button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onStartQuiz()
                      ),
                    );
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import your UserProfilePage
import 'package:mood_tracker/mood_entry_screen.dart'; // Import your MoodEntryScreen
import 'package:mood_tracker/auth/auth_service.dart'; // Import your AuthService

class WelcomeScreen extends StatelessWidget {
  final String userName; // User's name
  final String userEmail; // User's email

  WelcomeScreen({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  // List of happy affirmations
  final List<String> affirmations = [
    "You are enough just as you are.",
    "Today is full of possibilities.",
    "Believe in yourself and all that you are.",
    "You deserve all the good things in life.",
    "Your mood is your choice.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomAffirmation = affirmations[Random().nextInt(affirmations.length)];

    return Scaffold(
      backgroundColor: const Color(0xFFEAD3C4),
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      userName: userName,
                      userEmail: userEmail,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  randomAffirmation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoodTrackerQuiz()));
                  },
                  child: const Text("Let’s Track My Mood!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}