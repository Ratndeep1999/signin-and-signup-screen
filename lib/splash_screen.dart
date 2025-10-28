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
  SharedPreferencesServices prefs = SharedPreferencesServices();

  @override
  void initState() {
    super.initState();
    prefs.printSavedPrefs();
    _navigateToNextScreen();
  }

  /// Navigate After 3 Sec
  void _navigateToNextScreen() {
    Timer(Duration(milliseconds: 3000), () {
      _whereToNavigate();
    });
  }

  /// Were To Navigate
  void _whereToNavigate() {
    bool? isUserLoggedIn = prefs.getPrefBool(
      key: SharedPreferencesServices.kIsUserLoggedIn,
    );

    // If null then Navigate to SigningScreen
    if (isUserLoggedIn != null) {
      // If not null then check this condition
      if (isUserLoggedIn) {
        // If true then Home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SigningScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigningScreen()),
      );
    }
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
