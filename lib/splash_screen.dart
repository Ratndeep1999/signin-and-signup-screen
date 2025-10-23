import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';

import 'Custom Widgets/custom_clipping_design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigningScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

            /// Splash Icon
            Image.asset(
              "assets/icons/splash.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

          ],
        ),
      ),
    );
  }
}
