import 'package:flutter/material.dart';
import 'package:raven_frontend/components/Button.dart';
import 'package:raven_frontend/components/TextFeild.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final paswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),//space box from top
              
              // Logo
              Icon(
                Icons.lock,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 50),//space box

              // Welcome message
              Text('Welcome back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                ),
                ),
                const SizedBox(height: 10),//space box

              // Sign in message
              Text('SIGN IN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                ),
                ),
                const SizedBox(height: 40),//space box
              
              // Username text field
              TextFeild(
                controller: userNameController,
                hinttext:'Enter Phone Number or Email' ,
                obscureText: false,
              ),
              
              const SizedBox(height: 25),//space box

              // Password text field
              TextFeild(
                controller: paswordController,
                hinttext: 'Password',
                obscureText: true,
              ),
              
              const SizedBox(height: 1),//space box
              // Forgot password register
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password ?',
                  style: TextStyle(color: Colors.white),
                  ),
                ]
                ),
              ),
              

              const SizedBox(height: 70),//space box
              // Sign in button
              Button(),
              
              const SizedBox(height: 15),//space box
              // OR
             Text('Or',
              style: TextStyle(
                color: const Color.fromARGB(157, 255, 255, 255),
                fontSize: 18,
                
                ),
                ),

              const SizedBox(height: 15),//space box
              // Add local device
              Text('ADD LOCAL DEVICE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
