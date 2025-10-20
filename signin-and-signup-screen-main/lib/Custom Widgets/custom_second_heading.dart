import 'package:flutter/material.dart';

class CustomSecondHeading extends StatelessWidget {
  const CustomSecondHeading({
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
          /// Second Heading
          TextSpan(
            text: bigText,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),

          /// Small Description Text
          TextSpan(
            text: smallText,
            style: const TextStyle(
              fontSize: 11.0,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

