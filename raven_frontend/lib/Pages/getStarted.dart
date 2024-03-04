import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('raven_frontend/images/getstarted bg.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
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
                  primary: Colors.blue, // Replace with your desired button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
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
