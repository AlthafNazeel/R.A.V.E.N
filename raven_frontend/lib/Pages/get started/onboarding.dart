// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OnboardingScreen(),
//     );
//   }
// }


// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             children: [
//               Column(
//                 children: [
//                   Image.asset(
//                     'assets/images/onboarding/OB1.png', // Corrected asset path
//                     errorBuilder: (context, error, stackTrace) =>
//                         Text('Error: Could not load image'),
//                     width: double.infinity,
//                     height: 200.0,
//                     fit: BoxFit.cover,
//                   ),
//                   Text(
//                     'Safety at your fingertips',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     'Introducing RAVEN, your complete home safety solution',
//                     style: TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.normal,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }