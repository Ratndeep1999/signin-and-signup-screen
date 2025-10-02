import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_helping_clickable_text.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field_label.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field.dart';
import 'Custom Widgets/custom_clipping_design.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // variable for suffix-icon enable-disable
  bool suffixTap = false;

  // show or hide input text
  bool _obscureText = false;

  // save password
  bool _savePassword = false;

  // controllers
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // formKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This stops content from moving
      // resizeToAvoidBottomInset: false,
      /// Appbar
      appBar: AppBar(backgroundColor: Color(0xFFefb744)),

      /// Body
      body: SingleChildScrollView(
        child: InkWell(
          /// Method to Disable Hardware Keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          splashColor: Colors.transparent,
          child: SafeArea(
            child: Stack(
              children: [
                /// Background Custom Design
                const CustomClippingDesign(),

                /// Vertical Widget
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Heading Text
                    CustomHeading(
                      bigText: "Hello\n",
                      smallText: "Welcome Back!",
                    ),
                    const SizedBox(height: 40),

                    /// Main Section
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
                                bigText: "Login Account\n",
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

                              /// Email Address Field
                              CustomTextField(
                                hintText: "Your Email Address",
                                keyboardType: TextInputType.emailAddress,
                                isSuffixIcon: true,
                                suffixIcon: Icons.person,
                                obscureText: false,
                                textController: _emailAddress,
                                validation: _emailValidation,
                                topPadding: 15.0,
                                bottomPadding: 15.0,
                                leftPadding: 20.0,
                                hintTextFontSize: 14,
                              ),
                              const SizedBox(height: 26.0),

                              /// Password Label
                              const CustomTextFieldLabel(
                                label: 'Password',
                                labelFontSize: 15.0,
                              ),
                              const SizedBox(height: 8.0),

                              /// Password Field
                              CustomTextField(
                                hintText: "Enter Your Password",
                                keyboardType: TextInputType.visiblePassword,
                                isSuffixIcon: true,
                                suffixIcon: _obscureText
                                    ? Icons.lock
                                    : Icons.lock_open,
                                obscureText: _obscureText,
                                suffixTap: () {
                                  setState(() {
                                    suffixTap = !suffixTap;
                                    _obscureText = suffixTap;
                                  });
                                },
                                textController: _password,
                                validation: _passwordValidation,
                                topPadding: 15.0,
                                bottomPadding: 15.0,
                                leftPadding: 20.0,
                                hintTextFontSize: 14,
                              ),
                              const SizedBox(height: 24.0),

                              /// Save Password and Forgot Password Section
                              CustomHelpingClickableText(
                                onTap: () {
                                  setState(() {
                                    _savePassword = !_savePassword;
                                  });
                                },
                                savePassword: _savePassword,
                              ),
                              const SizedBox(height: 24.0),

                              /// Login Button
                              CustomButton(
                                label: 'Login Account',
                                loginClick: () {
                                  /// If Details is valid then Login..
                                  if (_formKey.currentState!.validate()) {
                                    _showSnackBar();
                                    Future.delayed(Duration(seconds: 3), () {
                                      /// TODO: Logic of Login
                                    });
                                  } else {}
                                },
                              ),
                              const SizedBox(height: 25.0),

                              /// Create Account text Button
                              const CustomClickableText(
                                label: 'Create New Account',
                              ),
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
      ),
    );
  }

  /// Email Validation Method
  String? _emailValidation(String? emailAddress) {
    if (emailAddress == null || emailAddress.isEmpty) {
      return 'Please enter your email';
    }
    if (emailAddress.contains(' ')) {
      return 'Space is not allow';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(emailAddress)) {
      return "Email address must contain '@' and '.com'";
    }
    return null;
  }

  /// Password Validation Method
  String? _passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please enter your password";
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (password.contains(' ')) {
      return "Space is not allowed";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'[!@\$&*~_]').hasMatch(password)) {
      return "Password must contain at least one special character (!@#\$&*~_)";
    }
    return null;
  }

  /// SnackBar Method
  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: CustomTextFieldLabel(
          label: 'Login....Please wait',
          labelFontSize: 15.0,
        ),
        backgroundColor: Color(0xFFfeb64d),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
