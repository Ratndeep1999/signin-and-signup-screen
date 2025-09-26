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

            //
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Heading Text
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      // First text
                      TextSpan(
                        text: "Hello\n",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          letterSpacing: 1.5,
                          height: 0.0,
                        ),
                      ),
                      // Second text
                      TextSpan(
                        text: "Welcome Back!",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          height: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
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
