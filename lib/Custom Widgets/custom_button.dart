import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.buttonPress,
  });

  final String label;
  final VoidCallback buttonPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFefb744),
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
