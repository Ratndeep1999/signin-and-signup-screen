import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field.dart';
import 'package:signin_and_signup_screens/signup_second_screen.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class SignupFirstScreen extends StatefulWidget {
  SignupFirstScreen({super.key});

  @override
  State<SignupFirstScreen> createState() => _SignupFirstScreenState();
}

class _SignupFirstScreenState extends State<SignupFirstScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  bool validUsername = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(backgroundColor: Color(0xFFefb744)),

      /// Body
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          splashColor: Colors.transparent,
          child: SafeArea(
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
                    const SizedBox(height: 36),

                    /// Card
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      elevation: 5.0,
                      child: Padding(
                        /// Content Padding
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 30.0,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              /// 2nd Heading
                              CustomSecondHeading(
                                bigText: "Personal Info\n",
                                smallText:
                                    "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                              ),
                              const SizedBox(height: 26.0),

                              /// Your Name Label
                              const CustomTextFieldLabel(
                                label: 'Your Name',
                                labelFontSize: 12.0,
                              ),
                              const SizedBox(height: 8.0),

                              // First and Last Name
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  /// First Name Field
                                  Flexible(
                                    child: CustomTextField(
                                      hintText: 'First Name',
                                      keyboardType: TextInputType.name,
                                      obscureText: false,
                                      isSuffixIcon: false,
                                      textController: _firstName,
                                      validation: _firstNameValidation,
                                      topPadding: 12.0,
                                      bottomPadding: 12.0,
                                      leftPadding: 20.0,
                                      hintTextFontSize: 13.0,
                                    ),
                                  ),

                                  SizedBox(width: 10.0),

                                  /// Last Name Field
                                  Flexible(
                                    child: CustomTextField(
                                      hintText: 'Last Name',
                                      keyboardType: TextInputType.name,
                                      obscureText: false,
                                      isSuffixIcon: false,
                                      textController: _lastName,
                                      validation: _lastNameValidation,
                                      topPadding: 12.0,
                                      bottomPadding: 12.0,
                                      leftPadding: 20.0,
                                      hintTextFontSize: 13.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),

                              /// Email Label
                              const CustomTextFieldLabel(
                                label: 'Email Address',
                                labelFontSize: 12.0,
                              ),
                              const SizedBox(height: 8.0),

                              /// Email Address Field
                              CustomTextField(
                                hintText: "Your Email Address",
                                keyboardType: TextInputType.emailAddress,
                                isSuffixIcon: true,
                                suffixIcon: Icons.email,
                                obscureText: false,
                                textController: _emailAddress,
                                validation: _emailValidation,
                                topPadding: 12.0,
                                bottomPadding: 12.0,
                                leftPadding: 20.0,
                                hintTextFontSize: 13.0,
                              ),
                              const SizedBox(height: 20.0),

                              /// Username Label
                              const CustomTextFieldLabel(
                                label: 'Username',
                                labelFontSize: 12.0,
                              ),
                              const SizedBox(height: 8.0),

                              /// Username Field
                              CustomTextField(
                                hintText: "example1234",
                                keyboardType: TextInputType.name,
                                isSuffixIcon: true,
                                suffixIcon: validUsername
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                suffixIconColor: validUsername
                                    ? Color(0xFF93c743)
                                    : Color(0xFFFF4C4C),
                                obscureText: false,
                                textController: _userName,
                                validation: _userNameValidation,
                                topPadding: 12.0,
                                bottomPadding: 12.0,
                                leftPadding: 20.0,
                                hintTextFontSize: 14.0,
                                onChanged: _onChangedUsername,
                              ),
                              const SizedBox(height: 22.0),

                              /// Save & Continue Button
                              CustomButton(
                                label: 'Save & Continue',
                                loginClick: () {
                                  /// If Details is valid then Next..
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return SignupSecondScreen();
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 20.0),

                              /// Create Account text Button
                              const CustomClickableText(label: 'Back to Login'),
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

  /// First Name Validation
  String? _firstNameValidation(String? firstName) {
    firstName = firstName?.trim();
    if (firstName == null || firstName.isEmpty) {
      return 'Please enter your first name';
    }
    if (firstName.length < 2) {
      return 'Name is too short';
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(firstName)) {
      return 'Please enter letters only';
    }
    return null;
  }

  /// Last Name Validation
  String? _lastNameValidation(String? lastName) {
    lastName = lastName?.trim();
    if (lastName == null || lastName.isEmpty) {
      return 'Please enter your last name';
    }
    if (lastName.length < 4) {
      return 'Name is too short';
    }
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(lastName)) {
      return 'Please enter letters only';
    }
    return null;
  }

  /// Email Validation Method
  String? _emailValidation(String? emailAddress) {
    emailAddress = emailAddress?.trim();
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

  /// Username Validation
  String? _userNameValidation(String? userName) {
    userName = userName?.trim();
    if (userName == null || userName.isEmpty) {
      return 'Please enter your username';
    }
    if (userName.length < 4) {
      return 'Username is too short';
    }
    if (userName == _emailAddress.text ||
        userName == _firstName.text ||
        userName == _lastName.text) {
      return "Username need to difference from others";
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(userName)) {
      return 'Only letters, numbers, and underscores are allowed';
    }
    // if (_takenUsernames.contains(userName)) {
    //   return 'Username is already taken';
    // }
    return null;
  }

  /// Username live Validation check
  bool? _onChangedUsername(String username) {
    debugPrint('Username : $username');
    if (_formKey.currentState!.validate()) {
      setState(() {
        validUsername = true;
      });
    } else {
      setState(() {
        validUsername = false;
      });
    }
    return null;
  }
}
