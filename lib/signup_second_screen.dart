import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_phone_number_field.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_security_question_field.dart';
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
  final TextEditingController _securityAnswer = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Security Questions
  final List<String> questions = [
    'What is your pet’s name?',
    'What is your mother’s maiden name?',
    'What was your first school?',
    'What is your favorite color?',
    'What city were you born in?',
  ];
  String? _selectedSecurityQuestion;

  // show or hide input text
  bool _obscureText = false;

  // check number is valid or not
  bool _isPhoneNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),

      /// Body
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
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
                            controller: _password,
                            validation: _passwordValidation,
                            topPadding: 12.0,
                            bottomPadding: 12.0,
                            leftPadding: 20.0,
                            hintTextFontSize: 13.0,
                          ),
                          const SizedBox(height: 20.0),

                          /// Phone Number Label
                          const CustomTextFieldLabel(
                            label: 'Phone Number',
                            labelFontSize: 12.0,
                          ),
                          const SizedBox(height: 8.0),

                          /// Phone Number Field
                          CustomPhoneNumberField(
                            suffixIcon: _isPhoneNumberValid
                                ? Icons.check_circle
                                : Icons.cancel,
                            suffixIconColor: _isPhoneNumberValid
                                ? Color(0xFF93c743)
                                : Color(0xFFFF4C4C),
                            onChanged: (PhoneNumber number) {
                              print("Hello " + number.completeNumber);
                              _onChangedPhoneNumber(number.number);
                            },
                            validation: (PhoneNumber? number) {
                              debugPrint("abc " + number.toString());
                              return _phoneNumberValidation(number);
                            },
                            controller: phoneController,
                          ),
                          const SizedBox(height: 20.0),

                          /// Security Question Label
                          const CustomTextFieldLabel(
                            label: 'Security Question',
                            labelFontSize: 12.0,
                          ),
                          const SizedBox(height: 8.0),

                          /// Security Question Field
                          CustomSecurityQuestionField(
                            securityQuestions: questions,
                            onSaved: (String? securityQuestion) {
                              _selectedSecurityQuestion = securityQuestion;
                            },
                            validation: (String? question) {
                              return _securityQuestionValidation(question);
                            },
                            onChanged: (String? selectedQuestion) {
                              debugPrint(
                                'Selected question: $selectedQuestion',
                              );
                            },
                          ),
                          const SizedBox(height: 8.0),

                          /// Security Answer Field
                          CustomTextField(
                            hintText: "Your Answer...",
                            keyboardType: TextInputType.text,
                            isSuffixIcon: false,
                            controller: _securityAnswer,
                            validation: _securityAnswerValidation,
                            topPadding: 12.0,
                            bottomPadding: 12.0,
                            leftPadding: 20.0,
                            hintTextFontSize: 13.0,
                            obscureText: false,
                          ),
                          const SizedBox(height: 22.0),

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

  /// Security Answer Validation
  String? _securityAnswerValidation(String? answer) {
    if (answer == null || answer.isEmpty) {
      return "Please enter the answer";
    }
    if (answer.length < 3) {
      return "Answer must be at least 3 characters long";
    }
    if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(answer)) {
      return "Only letters and numbers are allowed";
    }
    return null;
  }

  /// Phone Number Validation
  String? _phoneNumberValidation(PhoneNumber? number) {
    final phone = number?.number.trim();
    if (phone == null || phone.isEmpty) {
      return "Please enter your phone number";
    }
    if (phone.length != 10) {
      return "Mobile number must be 10 digits";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
      return "Only numbers are allowed";
    }
    return null; // valid
  }

  /// Phone Number live Validation Check
  void _onChangedPhoneNumber(String phoneNumber) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isPhoneNumberValid = true;
      });
    } else {
      setState(() {
        _isPhoneNumberValid = false;
      });
    }
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

  /// Security Questin Validation
  String? _securityQuestionValidation(question) {
    if (question == null || question.isEmpty) {
      return "Please select the question";
    }
    return null;
  }
}
