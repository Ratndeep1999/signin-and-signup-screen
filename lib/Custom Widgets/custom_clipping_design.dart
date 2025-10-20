import 'package:flutter/material.dart';

class CustomClippingDesign extends StatelessWidget {
  const CustomClippingDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundDesign(),
      child: SizedBox(
        height: 525,
        width: double.infinity,
        child: ColoredBox(color: Color(0xFFefb744)),
      ),
    );
  }
}

/// Clipped background Design
class BackgroundDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Path store to path
    Path path = Path();

    // extract height and width
    final width = size.width;
    final height = size.height;

    // First line
    path.lineTo(0, height - 320);

    // First curve
    path.quadraticBezierTo(5, height - 260, 220, height - 150);

    // Second curve
    path.quadraticBezierTo(350, height - 130, width, height - 160);

    // Final line
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
