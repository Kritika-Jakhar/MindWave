/*class UserProfile {
  String uid;
  String name;
  String email;
  String profilePictureUrl;

  UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    this.profilePictureUrl = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  UserProfile.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        name = map['name'],
        email = map['email'],
        profilePictureUrl = map['profilePictureUrl'] ?? '';
}*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  UserProfilePage({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: $userName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _editProfile(context); // Navigate to edit profile
              },
              child: const Text("Edit Profile"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _signOut(context); // Sign out the user
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    // Implement edit profile functionality here
    // For now, just show a snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit Profile feature is not implemented yet.')),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pop(context); // Go back to the previous screen after signing out
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have successfully signed out.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $e')),
      );
    }
  }
}







/*class UserProfile {
  String uid;
  String name;
  String email;
  String profilePictureUrl;

  UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    this.profilePictureUrl = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  UserProfile.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        name = map['name'],
        email = map['email'],
        profilePictureUrl = map['profilePictureUrl'];
}*/