import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Initialize Shared Preferences and Delete All Stored Data
  Future<void> _clearStoredPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Heading Text
                  CustomHeading(
                    bigText: "Home Screen\n",
                    smallText: "Welcome To Dashboard",
                  ),

                  /// Dashboard Icon
                  Image.asset(
                    "assets/icons/home.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),

                  /// Logout Button
                  CustomButton(
                    label: 'Logout',
                    loginClick: () {
                      _showSnackBar(label: 'Logout', context: context);
                      _logout(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigate to Signing Screen
  void _logout(context) {
    // Clear all Stored Shared Pref Data
    _clearStoredPrefData();

    // Delay 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigningScreen()),
      );
    });
  }

  /// SnackBar Method
  void _showSnackBar({required String label, context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextFieldLabel(label: label, labelFontSize: 15.0),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFFfeb64d),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
