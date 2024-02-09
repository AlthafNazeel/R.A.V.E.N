import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button ({super.key,});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(horizontal:125.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25)
      
      ),
      child: Center(
        child:Text('Sign In',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,

        ),
        ),
      ),
    );    
  }
}


//  // Welcome message
//               Text('Welcome back',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 ),
//                 ),
//                 const SizedBox(height: 10),//space box

              
//               // Profile text field
//               TextFeild(
//                 controller: userNameController,
//                 hinttext:'Profile' ,
//                 obscureText: false,
//               ),
              
//               const SizedBox(height: 25),//space box

//               // Device settings text field
//               TextFeild(
//                 controller: paswordController,
//                 hinttext: 'Device Settings',
//                 obscureText: true,
//               ),