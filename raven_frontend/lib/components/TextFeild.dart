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
          borderRadius: BorderRadius.circular(50)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white) 
        ),
        fillColor: Colors.grey.shade200,
        filled: true,   
        hintText: hinttext,           
        ),
      ),
    );
  }
}