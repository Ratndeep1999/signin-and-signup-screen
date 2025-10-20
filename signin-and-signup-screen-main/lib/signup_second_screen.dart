import 'package:flutter/material.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_second_heading.dart';

class SignupSecondScreen extends StatelessWidget {
  const SignupSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFefb744)),

      /// Body
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

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
                child: Column(
                  children: [
                    /// 2nd Heading
                    CustomSecondHeading(
                      bigText: "Secure Account\n",
                      smallText:
                          "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                    ),
                    const SizedBox(height: 35.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
