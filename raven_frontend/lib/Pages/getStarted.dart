import 'package:flutter/material.dart';
import 'package:raven_frontend/Pages/signIn.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      backgroundColor: Color.fromARGB(255, 38, 32, 49), // Set background color to deep purple
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to R.A.V.E.N!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Join the movement towards a safer future',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(89, 66, 118, 1), // Set button color to purple
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15), // Adjust padding
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
