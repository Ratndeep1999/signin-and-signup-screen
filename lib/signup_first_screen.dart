import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field.dart';
import 'Custom Widgets/customClippingDesign.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class SignupFirstScreen extends StatelessWidget {
  SignupFirstScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(backgroundColor: Colors.orange.shade300),

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
                              const SizedBox(height: 32.0),

                              /// Your Name Label
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
                                        if (firstName == null ||
                                            firstName.isEmpty) {
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
                                        if (lastName == null ||
                                            lastName.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24.0),

                              /// Email Label
                              const CustomTextFieldLabel(
                                label: 'Email Address',
                              ),
                              const SizedBox(height: 8.0),

                              /// Email Address Field
                              CustomTextField(
                                hintText: "Your Email Address",
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: Icons.email,
                                obscureText: false,
                                dynamicSuffixIcon: false,
                                textController: _emailAddress,
                                validation: _emailValidation,
                              ),
                              const SizedBox(height: 24.0),

                              /// Username Label
                              const CustomTextFieldLabel(label: 'Username'),
                              const SizedBox(height: 8.0),

                              /// Username Field
                              CustomTextField(
                                hintText: "example1234",
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: Icons.email,
                                obscureText: false,
                                dynamicSuffixIcon: false,
                                textController: _emailAddress,
                                validation: _emailValidation,
                              ),
                              const SizedBox(height: 24.0),

                              /// Save & Continue Button
                              CustomButton(
                                label: 'Save & Continue',
                                loginClick: () {
                                  /// If Details is valid then Login..
                                },
                              ),
                              const SizedBox(height: 25.0),

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
}
