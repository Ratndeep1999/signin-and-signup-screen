import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';

import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class ShowPasswordScreen extends StatelessWidget {
  const ShowPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Custom Background Design
            CustomClippingDesign(),

            Column(
              children: [
                /// Heading Text
                CustomHeading(
                  bigText: "Be Careful\n",
                  smallText: "Forgotten Password!",
                ),
                const SizedBox(height: 40),

                /// Card
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 50.0,
                    ),
                    child: Column(
                      children: [
                        /// 2nd Heading
                        CustomSecondHeading(
                          bigText: "Don't Forget Again\n",
                          smallText:
                              "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                        ),
                        const SizedBox(height: 32.0),

                        /// Email Label
                        const CustomTextFieldLabel(
                          label: 'Email Address',
                          labelFontSize: 15.0,
                        ),
                        const SizedBox(height: 8.0),

                        /// Email Address
                        _buildText(context, label: 'Email'),

                        const SizedBox(height: 22.0),

                        /// Password Label
                        const CustomTextFieldLabel(
                          label: 'Password',
                          labelFontSize: 15.0,
                        ),
                        const SizedBox(height: 8.0),

                        /// Password
                        _buildText(context, label: 'Password'),
                      ],
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

  /// Custom method to Show Email and Password
  Widget _buildText(BuildContext context, {required String label}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
