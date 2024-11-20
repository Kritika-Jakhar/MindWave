import 'package:flutter/material.dart';
import 'package:mood_tracker/auth/auth_service.dart';
import 'package:mood_tracker/widgets/button.dart';
import 'package:mood_tracker/auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      backgroundColor: Color(0xFF80B4AB),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                try {
                  await auth.signOut();
                  goToLogin(context); // Navigate to the login screen after sign out
                } catch (e) {
                  // Optionally, handle errors with a SnackBar or alert dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to sign out: $e")),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}
// Example usage in a Flutter widget
