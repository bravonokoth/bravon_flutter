import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'routes/app_routes.dart'; // Import the app routes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen, // Set initial route to Splash Screen
      routes: {
        // Define all routes
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        AppRoutes.createAccountScreen: (context) => const CreateAccountScreen(),
      },
    );
  }
}
