import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          // First text
          TextSpan(
            text: "Hello\n",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 45,
              letterSpacing: 1.5,
              height: 0.0,
            ),
          ),
          // Second text
          TextSpan(
            text: "Welcome Back!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              height: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}