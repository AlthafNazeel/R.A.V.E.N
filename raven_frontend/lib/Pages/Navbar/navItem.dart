import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;

  const NavItem({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 30.0,
            ),
            const SizedBox(width: 20.0), // Use const for fixed values
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 26.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}