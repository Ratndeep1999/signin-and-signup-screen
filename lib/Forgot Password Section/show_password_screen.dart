import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
import '../Custom Widgets/custom_clickable_text.dart';
import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class ShowPasswordScreen extends StatefulWidget {
  const ShowPasswordScreen({super.key});

  @override
  State<ShowPasswordScreen> createState() => _ShowPasswordScreenState();
}

class _ShowPasswordScreenState extends State<ShowPasswordScreen> {
  // SharedPreferencesService Object
  SharedPreferencesServices prefService = SharedPreferencesServices();

  // Parameters
  String? _userEmail;

  String? _userPassword;

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
                  bigText: "Warning!\n",
                  smallText: "Don't Share With Anyone",
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
                        _buildText(context, label: _userEmail ?? 'Refresh'),

                        const SizedBox(height: 22.0),

                        /// Password Label
                        const CustomTextFieldLabel(
                          label: 'Password',
                          labelFontSize: 15.0,
                        ),
                        const SizedBox(height: 8.0),

                        /// Password
                        _buildText(context, label: _userPassword ?? 'Refresh'),

                        const SizedBox(height: 40.0),

                        /// Refresh Button
                        InkWell(
                          onTap: () {
                            // to update email and password values
                            _updateDetails();
                          },
                          radius: 25.0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Material(
                            shape: const CircleBorder(),
                            elevation: 10.0,
                            shadowColor: Colors.black87,
                            color: const Color(0xFFefb744),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFefb744),
                              radius: 25.0,
                              child: Icon(
                                Icons.refresh,
                                color: Color(0xFFf7f0fa),
                                size: 43.0,
                                weight: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),

                        /// Back To Login Button
                        CustomClickableText(
                          label: 'Back to Login',
                          onTap: () {
                            Navigator.of(
                              context,
                            ).popUntil((route) => route.isFirst);
                          },
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

  /// Update Details method
  void _updateDetails() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        // update email and password
        _userEmail =
            prefService.getPrefString(
              key: SharedPreferencesServices.kEmailId,
            ) ??
            "Empty";
        _userPassword =
            prefService.getPrefString(
              key: SharedPreferencesServices.kPassword,
            ) ??
            "Empty";
      });
    });
  }
}
