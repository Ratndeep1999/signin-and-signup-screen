import 'package:flutter/material.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_second_heading.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({super.key});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// 2nd Heading
                      CustomSecondHeading(
                        bigText: "Secure Account\n",
                        smallText:
                            "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                      ),
                      const SizedBox(height: 35.0),

                      /// Save & Continue Button
                      CustomButton(
                        label: 'Save & Continue',
                        loginClick: () {
                          /// If Details is valid then Save and Signing Screen..
                          _checkValidation();
                        },
                      ),
                      const SizedBox(height: 20.0),

                      /// Create Account text Button
                      CustomClickableText(
                        label: 'Back to Login',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigate to Signing Screen
  void _navigateToSigningScreen() {
    // Direct navigate to First Page of Stack and Remove all Pages
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  /// It Validate all Fields
  void _checkValidation() {
    if (_formKey.currentState!.validate()) {
      // This triggers all onSaved methods
      _formKey.currentState!.save();
      _navigateToSigningScreen();
    }
  }
}
