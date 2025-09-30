import 'package:flutter/material.dart';

import 'Custom Widgets/customClippingDesign.dart';
import 'Custom Widgets/custom_heading.dart';

class SignupFirstScreen extends StatelessWidget {
  const SignupFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),

      /// Body
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Heading Text
                CustomHeading(bigText: "Hello\n", smallText: "Welcome Back!"),
                const SizedBox(height: 40),

                /// Card
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  elevation: 5.0,
                  child: Padding(
                    /// Content Padding
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 32.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
