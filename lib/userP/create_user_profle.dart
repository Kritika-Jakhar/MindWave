/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'user_profile.dart';

Future<void> createUserProfile(User user, String name) async {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  // Create a UserProfile instance
  UserProfile userProfile = UserProfile(
    uid: user.uid,
    name: name,
    email: user.email ?? 'No Email',
  );

  // Save the user profile in the database using toMap()
  await databaseReference.child('users').child(user.uid).set(userProfile.toMap());
}

Future<void> signUp(String email, String password, String name) async {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  // Create the user profile after successful sign-up
  await createUserProfile(userCredential.user!, name);
}

Future<UserProfile?> getUserProfile(String uid) async {
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(uid);

  // Retrieve the profile data
  final DatabaseEvent event = await userRef.once();

  if (event.snapshot.exists) {
    // Convert the snapshot data to a UserProfile instance
    return UserProfile.fromMap(Map<String, dynamic>.from(event.snapshot.value as Map));
  } else {
    print("User does not exist.");
    return null;
  }
}*/









/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> createUserProfile(User user, String name) async {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  Map<String, dynamic> newUserProfile = {
    'uid': user.uid,
    'name': name,
    'email': user.email ?? 'No Email',
  };

  // Create or update the user profile in the database
  await databaseReference.child('users').child(user.uid).set(newUserProfile);
}
Future<void> signUp(String email, String password, String name) async {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  // Create the user profile after successful sign-up
  await createUserProfile(userCredential.user!, name);
}


Future<void> getUserProfile(String uid) async {
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(uid);

  // Listen for a single event, as once() now returns a DatabaseEvent
  final DatabaseEvent event = await userRef.once();

  if (event.snapshot.exists) {
    Map<String, dynamic> userProfile = Map<String, dynamic>.from(event.snapshot.value as Map);
    print("User Profile: $userProfile");
  } else {
    print("User does not exist.");
  }
}*/