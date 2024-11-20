/*import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/userP/user_profile_page.dart'; // Import the new UserProfileScreen
import 'package:mood_tracker/userP/user_profile.dart';
import 'package:mood_tracker/welcome_screen.dart';

import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
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
              const Color(0xFF80B4AB), // Primary color
              const Color(0xFFB0E0D9), // Lighter shade
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
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
                isPassword: true,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      // Navigate to UserProfileScreen with user details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserProfilePage(
            userName: user.displayName ?? "User", // Assuming user object has displayName
            userEmail: user.email ?? "No Email",
          ),
        ),
      );
    }
  }
}*/










/*import 'dart:developer';

import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/home_screen.dart';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/welcome_screen.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
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
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToWelcomeScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(onStartQuiz: () {})),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToWelcomeScreen(context);
    }
  }
}*/
/*import 'dart:developer';

import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/home_screen.dart';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/welcome_screen.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
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
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToWelcomeScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(onStartQuiz: () {})),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToWelcomeScreen(context);
    }
  }
}*/
/*import 'dart:developer';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/home_screen.dart';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/welcome_screen.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';
import 'package:flutter/material.dart';*/

/*class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
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
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToWelcomeScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(onStartQuiz: () {})),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");

      // Retrieve user data from Firestore
      final userData = await _auth.getUserData(user.uid);
      if (userData != null) {
        log("User Data: ${userData['username']}");
        // You can pass userData to the welcome screen if needed
      }

      goToWelcomeScreen(context);
    }
  }
}*/


/*import 'dart:developer';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/home_screen.dart';
import 'package:mood_tracker/main.dart';
import 'package:mood_tracker/welcome_screen.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? errorMessage; // Variable to hold error messages

  @override
  void dispose() {
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              if (errorMessage != null) ...[
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
              ],
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
                //obscureText: true, // Make the password field obscure
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToWelcomeScreen(BuildContext context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(onStartQuiz: () {})),
      );

  _login() async {
    setState(() {
      errorMessage = null; // Reset error message
    });
    
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");

      // Retrieve user data from Realtime Database
      final userData = await _auth.getUserData(user.uid);
      if (userData != null) {
        log("User Data: ${userData['username']}");
        // You can pass userData to the welcome screen if needed
      } else {
        log("User data not found.");
      }

      goToWelcomeScreen(context);
    } else {
      // Handle login failure
      setState(() {
        errorMessage = "Login failed. Please check your credentials.";
      });
    }
  }
}*/

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/auth/signup_screen.dart';
import 'package:mood_tracker/welcome_screen.dart'; // Ensure this is the correct import
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
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
                "Login",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
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
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => goToSignup(context),
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Color.fromARGB(255, 229, 110, 101)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  goToWelcomeScreen(BuildContext context, String userName, String userEmail) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(
          userName: userName,
          userEmail: userEmail,
          //onStartQuiz: () {},
        ),
      ),
    );
  }

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");

      // Retrieve user data from Firestore
      final userData = await _auth.getUserData(user.uid);
      if (userData != null) {
        log("User Data: ${userData['username']}, Email: ${userData['email']}");
        goToWelcomeScreen(context, userData['username'], userData['email']);
      } else {
        log("User data not found.");
        // Handle the case where user data is not found
      }
    } else {
      log("Login failed.");
      // Handle login failure
    }
  }
}