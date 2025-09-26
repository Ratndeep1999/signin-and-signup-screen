import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_label_widget.dart';

import 'Custom Widgets/custom_textfield_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This stops content from moving
      // resizeToAvoidBottomInset: false,
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),
      // Remaining Body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              ClipPath(
                // background custom deign
                clipper: BackgroundDesign(),
                child: SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.orange.shade300),
                ),
              ),

              //
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Heading Text
                  const Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        // First text
                        TextSpan(
                          text: "Hello\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            letterSpacing: 1.5,
                            height: 0.0,
                          ),
                        ),
                        // Second text
                        TextSpan(
                          text: "Welcome Back!",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            height: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 32.0,
                        ),
                        child: Column(
                          children: [
                            /// 2nd Heading
                            const Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  /// Second Heading
                                  TextSpan(
                                    text: "Login Account\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30,
                                    ),
                                  ),

                                  /// Small description text
                                  TextSpan(
                                    text:
                                        "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),

                            /// Email Label
                            const CustomLabelWidget(label: 'Email Address'),

                            const SizedBox(height: 8.0),

                            /// Email Address Field
                            CustomTextfieldWidget(
                              hintText: "Your Email Address",
                              suffixIcon: Icons.person,
                              obscureText: false,
                              dynamicSuffixIcon: false,
                            ),

                            SizedBox(height: 25.0),

                            /// Password Label
                            const CustomLabelWidget(label: 'Password'),

                            const SizedBox(height: 8.0),

                            /// Email Address Field
                            CustomTextfieldWidget(
                              hintText: "Enter Your Password",
                              suffixIcon: Icons.lock,
                              obscureText: true,
                              dynamicSuffixIcon: true,
                            ),

                            SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Clipped background Design
class BackgroundDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //
    Path path = Path();

    // extract height and width
    final width = size.width;
    final height = size.height;

    // First line
    path.lineTo(0, height - 350);

    // First curve
    path.quadraticBezierTo(5, height - 230, 250, height - 100);

    // Second curve
    path.quadraticBezierTo(350, height - 100, width, height - 140);

    // Final line
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
