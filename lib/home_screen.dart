import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';

import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninScreen()),
    );
  }
}
