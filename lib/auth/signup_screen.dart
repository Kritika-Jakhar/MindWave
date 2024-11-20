/*import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();

  final TextEditingController _Username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _Username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Primary color
              Color(0xFFB0E0D9), // Lighter shade
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Signup",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                hint: "Enter Username",
                label: "Name",
                controller: _Username,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Password",
                label: "Password",
                controller: _password,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Signup",
                onPressed: _signup,
              ),
              const SizedBox(height: 5),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(
      _email.text, 
      _password.text
    );

    if (user != null) {
      log("User Signed Up");
      
      // Optionally, update the user profile with their name
      await user.updateDisplayName(_Username.text);
      
      Navigator.pop(context); // Navigate back to login
    }
  }
}*/
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();

  final TextEditingController _Username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _Username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF80B4AB), // Primary color
              Color(0xFFB0E0D9), // Lighter shade
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Signup",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                hint: "Enter Username",
                label: "Name",
                controller: _Username,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Password",
                label: "Password",
                controller: _password,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Signup",
                onPressed: _signup,
              ),
              const SizedBox(height: 5),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(
      _email.text,
      _password.text,
      _Username.text, // Pass the username
    );

    if (user != null) {
      log("User Signed Up");
      Navigator.pop(context); // Navigate back to login
    }
  }
}