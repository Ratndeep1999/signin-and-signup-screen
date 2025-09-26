import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),
      // Remaining Body
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              // background custom deign
              clipper: BackgroundDesign(),
              child: SizedBox(
                height: 600,
                width: double.infinity,
                child: ColoredBox(color: Colors.orange.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
