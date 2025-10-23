import 'package:flutter/material.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class SignupSecondScreen extends StatefulWidget {
  const SignupSecondScreen({super.key});

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();

  // show or hide input text
  bool _obscureText = false;

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


                      /// Birthday Label
                      const CustomTextFieldLabel(
                        label: 'Birthday',
                        labelFontSize: 12.0,
                      ),
                      const SizedBox(height: 8.0),

                      /// Birthday Field


                      /// Password Label
                      const CustomTextFieldLabel(
                        label: 'Password',
                        labelFontSize: 12.0,
                      ),
                      const SizedBox(height: 8.0),

                      /// Password Field
                      CustomTextField(
                        hintText: "Enter Your Password",
                        keyboardType: TextInputType.visiblePassword,
                        isSuffixIcon: true,
                        suffixIcon: _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obscureText: _obscureText,
                        suffixTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        textController: _password,
                        validation: _passwordValidation,
                        topPadding: 12.0,
                        bottomPadding: 12.0,
                        leftPadding: 20.0,
                        hintTextFontSize: 13.0,
                        // onSaved: (String? email) {
                        //   emailAddress = email!;
                        // },
                      ),
                      const SizedBox(height: 20.0),

                      /// Phone Number Label
                      const CustomTextFieldLabel(
                        label: 'Phone Number',
                        labelFontSize: 12.0,
                      ),
                      const SizedBox(height: 8.0),

                      /// Phone Number Field


                      /// Security Question Label
                      const CustomTextFieldLabel(
                        label: 'Security Question',
                        labelFontSize: 12.0,
                      ),
                      const SizedBox(height: 8.0),

                      /// Security Question Field

                      /// Security Answer Field


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

  /// It Validate all Fields
  void _checkValidation() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      // This triggers all onSaved methods
      _formKey.currentState!.save();
      _navigateToSigningScreen();
    }
  }

  /// Navigate to Signing Screen
  void _navigateToSigningScreen() {
    // Direct navigate to First Page of Stack and Remove all Pages
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
