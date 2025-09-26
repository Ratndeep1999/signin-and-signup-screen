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

class BackgroundDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {}

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
