import 'package:flutter/material.dart';
import 'package:raven_frontend/components/AppFonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final Color cursorColor;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.cursorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: const Color.fromARGB(79, 0, 0, 0).withOpacity(0.2),
      //       spreadRadius: 3,
      //       blurRadius: 10,
      //       offset: Offset(15, 9),
      //     ),
      //   ],
      // ),
      child: TextField(
        cursorColor: cursorColor,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.only(left: 25.0),
          labelText: label,
          hintText: hint,
          labelStyle: AppFonts.bodyTextFont(),
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 146, 146, 146),
            fontSize: 14.0,
          ),
          prefixIcon: Icon(icon, color: cursorColor, size: 18),
          enabledBorder: UnderlineInputBorder(
            borderSide : BorderSide (color: const Color.fromARGB(255, 0, 0, 0), width: 2),
            // borderRadius: BorderRadius.circular(1.0),
          ),
          floatingLabelStyle: TextStyle(
            color: cursorColor,
            fontSize: 18.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cursorColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
