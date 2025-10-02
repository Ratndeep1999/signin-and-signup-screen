import 'package:flutter/material.dart';

class CustomTextFieldLabel extends StatelessWidget {
  const CustomTextFieldLabel({super.key, required this.label, required this.labelFontSize});

  final String label;
  final double labelFontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(
          fontSize: labelFontSize,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    );
  }
}
