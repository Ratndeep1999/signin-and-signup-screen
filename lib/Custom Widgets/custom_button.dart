import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.label, required this.loginClick});

  final String label;
  final VoidCallback loginClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loginClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade300,
          foregroundColor: Colors.black,
          elevation: 3.0,
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
