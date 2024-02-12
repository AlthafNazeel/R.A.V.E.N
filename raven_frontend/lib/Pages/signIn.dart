import 'package:flutter/material.dart';
import 'package:raven_frontend/components/TextFeild.dart';
import 'package:raven_frontend/Pages/getStarted.dart';

class SignInp extends StatelessWidget {
  SignInp({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 214, 230),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              
              // Logo
              Icon(
                Icons.lock,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 50),

              // Welcome message
              Text('Welcome back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                ),
                ),
                const SizedBox(height: 50),
              
              // Username text field
              const SizedBox(height: 20),
                // Password field
                CustomTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.keyboard,
                  cursorColor: Colors.black,
                ),
              
              const SizedBox(height: 25),
              // Password text field
                CustomTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.keyboard,
                  cursorColor: Colors.black,
                ),
              
              // Forgot password register
              
              // Sign in button
              
              // Add local device
            ],
          ),
        ),
      ),
    );
  }
}
