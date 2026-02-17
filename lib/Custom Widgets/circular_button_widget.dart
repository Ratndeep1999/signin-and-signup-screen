import 'package:flutter/material.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFefb744),
      radius: 16,
      child: child,
    );
  }
}
