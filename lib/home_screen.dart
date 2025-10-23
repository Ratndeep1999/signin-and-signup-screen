import 'package:flutter/material.dart';

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

            /// Heading Text
            Align(
              alignment: Alignment(0,-0.8),
              child: CustomHeading(
                bigText: "Home Screen\n",
                smallText: "Welcome To Dashboard",
              ),
            ),

            /// Dashboard Icon
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/home.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            /// Logout Button
            CustomButton(
              label: 'Logout',
              loginClick: () {
                _logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout() {}
}
