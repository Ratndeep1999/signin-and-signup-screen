import 'dart:async';
import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
import 'package:signin_and_signup_screens/home_screen.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';
import 'Custom Widgets/custom_clipping_design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SharedPreferencesServices prefServices =
      SharedPreferencesServices();

  @override
  void initState() {
    super.initState();
    prefServices.initSharedPref;
    _whereToGo();
  }

  /// Navigate After 2 Sec
  Future<void> _whereToGo() async {
    final loginStatus = await prefServices.getLoggedInStatus();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => loginStatus ? HomeScreen() : SigningScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFefb744)),
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

            /// Splash Icon
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/splash.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
