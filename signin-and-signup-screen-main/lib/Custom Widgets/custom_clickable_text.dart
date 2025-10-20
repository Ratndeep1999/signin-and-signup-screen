import 'package:flutter/material.dart';
import '../signup_first_screen.dart';

class CustomClickableText extends StatelessWidget {
  const CustomClickableText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// Navigate to Signup First Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignupFirstScreen()),
        );
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
