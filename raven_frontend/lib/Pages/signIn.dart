import 'package:flutter/material.dart';
import 'package:raven_frontend/components/TextFeild.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 0, 20),
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
              TextFeild(
                controller: userNameController,
                hinttext:'Username' ,
                obscureText: false,
              ),
              
              const SizedBox(height: 25),
              // Password text field
              TextFeild(
                controller: paswordController,
                hinttext: 'Password',
                obscureText: true,
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
