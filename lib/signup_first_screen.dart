import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field.dart';

import 'Custom Widgets/customClippingDesign.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class SignupFirstScreen extends StatelessWidget {
  SignupFirstScreen({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

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
                CustomHeading(
                  bigText: "Join Us\n",
                  smallText: "Create Free Account",
                ),
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
                    child: Column(
                      children: [
                        /// 2nd Heading
                        CustomSecondHeading(
                          bigText: "Personal Info\n",
                          smallText:
                              "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                        ),
                        const SizedBox(height: 32.0),

                        /// Email Label
                        const CustomTextFieldLabel(label: 'Your Name'),
                        const SizedBox(height: 8.0),

                        /// First and Last Name
                        Row(
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            // First Name
                            Flexible(
                              child: CustomTextField(
                                hintText: 'First Name',
                                keyboardType: TextInputType.name,
                                obscureText: false,
                                dynamicSuffixIcon: false,
                                textController: _firstName,
                                validation: (String? firstName) {
                                  if (firstName == null || firstName.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(width: 10.0),

                            // Last Name
                            Flexible(
                              child: CustomTextField(
                                hintText: 'Last Name',
                                keyboardType: TextInputType.name,
                                obscureText: false,
                                dynamicSuffixIcon: false,
                                textController: _lastName,
                                validation: (String? lastName) {
                                  if (lastName == null || lastName.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
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
}
