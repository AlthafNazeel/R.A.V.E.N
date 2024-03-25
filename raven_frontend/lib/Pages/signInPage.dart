import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:raven_frontend/components/TextFeild.dart';
import 'package:raven_frontend/components/AppFonts.dart';
import 'package:raven_frontend/firebase_options.dart';
import 'package:raven_frontend/navMenu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(), // Set SignIn as the home page
    );
  }
}

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final FirebaseApi api = FirebaseApi();
  // Controllers for handling user input
  final TextEditingController userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),

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

                const SizedBox(height: 100),

                // Email text field
                CustomTextField(
                  controller: userNameController,
                  label: 'Network ID',
                  hint: 'Network id',
                  icon: Icons.perm_identity_sharp,
                  cursorColor: Colors.black,
                ),

                const SizedBox(height: 30),

                // Password field
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock_rounded,
                  cursorColor: Colors.black,
                ),

                const SizedBox(height: 10),
                // Forgot password link
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 88, 88, 88),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // Sign In button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                    api.addSystem(
                        userNameController.text, passwordController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NavMenu()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 101, 36, 120),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: AppFonts.ButtonFont(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const NavMenu(),
    );
  }
}
