import 'package:flutter/material.dart';
import 'package:raven_frontend/components/TextFeild.dart';
import 'package:raven_frontend/components/AppFonts.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  // Controllers for handling user input
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/bgpicnew.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),

                // // App Logo
                // Icon(
                //   Icons.lock,
                //   size: 100,
                //   color: Color.fromARGB(255, 101, 36, 120),
                // ),

                const SizedBox(height: 30),

                // Welcome message
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: AppFonts.heading1Font(),
                    ),
                  ],
                ),

                // Sign in message
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Sign in to continue.',
                        style: AppFonts.heading2Font()),
                  ],
                ),

                const SizedBox(height: 50),

                // Email text field
                CustomTextField(
                  label: 'Email',
                  hint: 'Username or e-mail',
                  icon: Icons.email_rounded,
                  cursorColor: Colors.black,
                ),

                const SizedBox(height: 20),
                // Password field
                CustomTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock_rounded,
                  cursorColor: Colors.black,
                ),

                const SizedBox(height: 10),
                // Forgot password link
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 88, 88, 88),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Sign In button
                Container(
                  // width: 250,
                  padding: EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 8), // Adjust the values as needed
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 101, 36, 120),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: AppFonts.ButtonFont(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // OR separator
                Text(
                  '-- or --',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                // Add local device message
                Text(
                  'ADD LOCAL DEVICE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Expanded(
                  child: SizedBox(), // Takes up remaining space
                ),
                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                        style: AppFonts.bodyTextFont()),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 76, 114),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
