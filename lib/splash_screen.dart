import 'package:flutter/material.dart';

import 'Custom Widgets/custom_clipping_design.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),
          ],
        ),
      ),
    );
  }
}
