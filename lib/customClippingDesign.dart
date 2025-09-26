import 'package:flutter/material.dart';

/// Clipped background Design
class BackgroundDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //
    Path path = Path();

    // extract height and width
    final width = size.width;
    final height = size.height;

    // First line
    path.lineTo(0, height - 350);

    // First curve
    path.quadraticBezierTo(5, height - 230, 250, height - 100);

    // Second curve
    path.quadraticBezierTo(350, height - 100, width, height - 140);

    // Final line
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}