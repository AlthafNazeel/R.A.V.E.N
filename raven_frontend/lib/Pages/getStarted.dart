import 'package:flutter/material.dart';

import 'package:raven_frontend/Pages/signInPage.dart';
import 'package:raven_frontend/components/AppFonts.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('raven_frontend/images/getstarted bg.jpg'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // // appBar: AppBar(
      // //   title: Text('Get Started'), // Set the title if needed
      // // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgpicnew.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'raven_frontend/images/ravenLogo.png',
                height: 100,
                width: 100,
              ),
              SizedBox(height: 20),
              Text(
                "JOIN THE MOVEMENT TOWARDS A SAFER FUTURE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your logic here for the button action
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.blue, // Replace with your desired button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Text(
                'Join the movement\n towards a safer future',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100.0), // Adjust the spacing as needed
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.pushNamed(
                    context,
                    '/signInPage',
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 109, 42, 130),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Get Started',
                    style: AppFonts.ButtonFont(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
