import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_label_widget.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_textfield_widget.dart';
import 'customClippingDesign.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // variable for suffix-icon dynamic
  bool suffixTap = false;

  // show or hide input text
  bool _obscureText = false;

  // save password
  bool _savePassword = false;

  // controllers
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This stops content from moving
      // resizeToAvoidBottomInset: false,
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),

      /// Body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              /// Background Custom Design
              ClipPath(
                clipper: BackgroundDesign(),
                child: SizedBox(
                  height: 525,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.orange.shade300),
                ),
              ),

              /// Vertical Widget
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Heading Text
                  CustomHeading(bigText: "Hello\n", smallText: "Welcome Back!"),
                  const SizedBox(height: 40),

                  /// Main Section
                  SizedBox(
                    width: double.infinity,
                    // Card
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      elevation: 5.0,
                      child: Padding(
                        // Content Padding
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 32.0,
                        ),
                        child: Column(
                          children: [
                            /// 2nd Heading
                            CustomSecondHeading(
                              bigText: "Login Account\n",
                              smallText:
                                  "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                            ),
                            const SizedBox(height: 32.0),

                            /// Email Label
                            const CustomLabelWidget(label: 'Email Address'),
                            const SizedBox(height: 8.0),

                            /// Email Address Field
                            CustomTextfieldWidget(
                              hintText: "Your Email Address",
                              keyboardType: TextInputType.emailAddress,
                              suffixIcon: Icons.person,
                              obscureText: false,
                              dynamicSuffixIcon: false,
                              textController: _emailAddress,
                            ),
                            SizedBox(height: 24.0),

                            /// Password Label
                            const CustomLabelWidget(label: 'Password'),
                            const SizedBox(height: 8.0),

                            /// Password Field
                            CustomTextfieldWidget(
                              hintText: "Enter Your Password",
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: _obscureText
                                  ? Icons.lock
                                  : Icons.lock_open,
                              obscureText: _obscureText,
                              dynamicSuffixIcon: true,
                              suffixTap: () {
                                setState(() {
                                  suffixTap = !suffixTap;
                                  _obscureText = suffixTap;
                                });
                              },
                              textController: _password,
                            ),
                            SizedBox(height: 24.0),

                            /// Save Password and Forgot Password Section
                            Row(
                              children: [
                                /// Save Password Custom Checkbox
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _savePassword = !_savePassword;
                                    });
                                  },
                                  splashColor: Colors.transparent,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    radius: 10.5,
                                    child: CircleAvatar(
                                      radius: 10.0,
                                      backgroundColor: _savePassword
                                          ? Color(0xFF93c743)
                                          : Color(0xFFF7F0FA),
                                      child: Visibility(
                                        visible: _savePassword,
                                        child: Icon(
                                          Icons.check,
                                          size: 16.0,
                                          color: Colors.white,
                                          weight: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),

                                /// Label of Forget Password
                                Text(
                                  'Save Password',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                Spacer(),

                                /// Forgot Password
                                InkWell(
                                  onTap: () {},
                                  splashColor: Colors.transparent,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.0),

                            /// Login Button
                            CustomButton(label: 'Login Account'),

                            SizedBox(height: 25.0),

                            /// Create Account text Button
                            CustomClickableText(label: 'Create New Account'),
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
