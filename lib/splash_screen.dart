import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';
import 'Custom Widgets/custom_clipping_design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPref();
    _navigateToNextScreen();
  }

  // It Initialize the object of Shared Preferences
  Future<void> _initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Navigate After 3 Sec
  void _navigateToNextScreen(){
    Timer(Duration(milliseconds: 3000), () {
      _whereToNavigate();
    });
  }

  /// Were To Navigate
  void _whereToNavigate(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigningScreen()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
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
