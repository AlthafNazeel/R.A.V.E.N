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
