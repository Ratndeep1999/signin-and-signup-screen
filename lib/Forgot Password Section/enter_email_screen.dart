import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';
import '../Custom Widgets/custom_button.dart';
import '../Custom Widgets/custom_clickable_text.dart';
import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_text_field.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  // SharedPreferencesServices Object
  SharedPreferencesServices pefService = SharedPreferencesServices();

  // Controller and Key
  final TextEditingController _emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Parameters
  String? _forgetPasswordEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: _unfocusKeyboard,
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
                      bigText: "Get Your\n",
                      smallText: "Forgotten Password!",
                    ),
                    const SizedBox(height: 40),

                    /// Card Section
                    _buildCard(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Refactored Card Method
  Card _buildCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: AutofillGroup(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// 2nd Heading
                CustomSecondHeading(
                  bigText: "Enter Your Email\n",
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
                  controller: _emailAddressController,
                  validation: _emailValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.next,
                  autofillHints: [AutofillHints.email],
                  onSaved: (String? emailAddress) {
                    _forgetPasswordEmail = emailAddress;
                  },
                ),
                const SizedBox(height: 22.0),

                /// Save & Continue Button
                CustomButton(
                  label: 'Check Email',
                  loginClick: () {
                    /// If Email is valid then Next..
                    //_checkValidation();
                    _formKey.currentState!.validate();
                    _formKey.currentState!.save();
                    if ( _forgetPasswordEmail ==
                        pefService.getPrefString(
                          key: SharedPreferencesServices.kEmailId,
                        )) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SigningScreen(),
                        ),
                      );
                    }
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

  /// Method to unfocus the keyboard
  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
