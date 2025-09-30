import 'package:flutter/material.dart';

class CustomTextFieldLabel extends StatelessWidget {
  const CustomTextFieldLabel({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
      ),
    );
  }
}
