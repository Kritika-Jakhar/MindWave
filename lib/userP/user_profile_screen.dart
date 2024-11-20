/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mood_tracker/userP/user_profile.dart'; // Ensure you have this file set up as discussed before

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserProfile? userProfile;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      UserProfile? profile = await getUserProfile(user.uid);
      setState(() {
        userProfile = profile;
      });
    }
  }

  Future<void> _updateProfilePhoto() async {
    // Implement photo update functionality here
    // Use image_picker package to select an image and upload it to Firebase Storage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: userProfile == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userProfile!.photoUrl ?? 'https://example.com/default-avatar.png'), // Default image
                  ),
                  SizedBox(height: 20),
                  Text('Name: ${userProfile!.name}'),
                  Text('Email: ${userProfile!.email}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateProfilePhoto,
                    child: Text('Change Profile Photo'),
                  ),
                ],
              ),
            ),
    );
  }
}*/
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String userName; // User's name
  final String userEmail; // User's email

  const UserProfileScreen({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $userName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add functionality here to edit the profile, if needed
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}