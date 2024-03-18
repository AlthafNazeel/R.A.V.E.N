import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body : Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  Text(
                  'Safety at your fingertips',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, Align: TextAlign.center, ),),

              
                  Image.asset(
                    'raven_frontend/images/onboarding/OB1.png',
                    errorBuilder: (context, error, stackTrace) => Text('Error: Could not load image'),
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                 
                ],

              ),
            ],

          ),

        ],
      ),

    );
  }
}
