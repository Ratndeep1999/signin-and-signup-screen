import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    super.key, required this.bigText, required this.smallText,
  });
  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          // First text
          TextSpan(
            text: bigText,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 45,
              letterSpacing: 1.5,
              height: 0.0,
            ),
          ),
          // Second text
          TextSpan(
            text: smallText,
            style: const TextStyle(
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