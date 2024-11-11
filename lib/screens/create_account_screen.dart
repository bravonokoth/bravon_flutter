import 'package:flutter/material.dart';
import 'package:bravon_flutter/screens/splash_screen.dart';
import 'package:bravon_flutter/widgets/custom_app_bar.dart';  // Import the CustomAppBar

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D9F7), // Pale blue background
      appBar: CustomAppBar(
        title: 'Sign Up', // The app bar title is now "Login"
        showBackButton: true, // Show the back button
      ),// Use CustomAppBar here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5, // Add shadow to the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Name input with shadow effect
                  _buildShadowedTextField(
                    controller: _nameController,
                    label: 'Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // Age input with shadow effect
                  _buildShadowedTextField(
                    controller: _ageController,
                    label: 'Age',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  // Email input with shadow effect
                  _buildShadowedTextField(
                    controller: _emailController,
                    label: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  // Password input with shadow effect
                  _buildShadowedTextField(
                    controller: _passwordController,
                    label: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Proceed with account creation logic
                      }
                    },
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build shadowed text fields with light/sky blue shadow
  Widget _buildShadowedTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.2), // Light sky blue shadow
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove the default border
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
      ),
    );
  }
}
