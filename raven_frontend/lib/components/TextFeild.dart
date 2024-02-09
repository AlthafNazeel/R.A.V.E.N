import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {

final controller;
  final String hinttext;
  final bool obscureText;

  const TextFeild ({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obscureText,
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black) 
        ),
        fillColor: Colors.grey.shade100,
        filled: true,   
        hintText: hinttext,           
        ),
      ),
    );
  }
}