import 'package:bravon_flutter/screens/create_account_screen.dart';
import 'package:bravon_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // Import the app routes

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 34, 243),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Comforter App',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Use the custom slide transition for Login Screen
                Navigator.pushReplacement(
                  context,
                  _createSlideTransition(AppRoutes.loginScreen, AxisDirection.left),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Use the custom slide transition for Create Account Screen
                Navigator.pushReplacement(
                  context,
                  _createSlideTransition(AppRoutes.createAccountScreen, AxisDirection.right),
                );
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create a slide transition
  PageRouteBuilder _createSlideTransition(String routeName, AxisDirection direction) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        Widget page;
        if (routeName == AppRoutes.loginScreen) {
          page = const LoginScreen(); //  LoginScreen widget
        } else if (routeName == AppRoutes.createAccountScreen) {
          page = const CreateAccountScreen(); //  CreateAccountScreen widget
        } else {
          page = const SplashScreen(); // Default fallback (in case routeName is unknown)
        }

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: direction == AxisDirection.left ? Offset(-1.0, 0.0) : Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: page,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // Duration of the slide transition
    );
  }
}
