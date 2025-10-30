import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
import '../Custom Widgets/custom_button.dart';
import '../Custom Widgets/custom_clickable_text.dart';
import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_security_question_field.dart';
import '../Custom Widgets/custom_text_field.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class ValidateAnswerScreen extends StatefulWidget {
  const ValidateAnswerScreen({super.key});

  @override
  State<ValidateAnswerScreen> createState() => _ValidateAnswerScreenState();
}

class _ValidateAnswerScreenState extends State<ValidateAnswerScreen> {
  // Shared Preferences Services Object
  SharedPreferencesServices prefService = SharedPreferencesServices();

  // Controller and form key
  late TextEditingController _securityAnswerController;
  final _formKey = GlobalKey<FormState>();

  // Security Questions
  final List<String> _questions = [
    'What is your pet’s name?',
    'What is your mother’s maiden name?',
    'What was your first school?',
    'What is your favorite color?',
    'What city were you born in?',
  ];

  // Parameters
  String? _userSecurityQuestion;
  String? _userSecurityAnswer;

  @override
  void initState() {
    _securityAnswerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _securityAnswerController.dispose();
    super.dispose();
  }

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
                /// Custom Background Design
                CustomClippingDesign(),

                Column(
                  children: [
                    /// Heading Text
                    CustomHeading(
                      bigText: "Now\n",
                      smallText: "Conform Yourself!",
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
                        child: AutofillGroup(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                /// 2nd Heading
                                CustomSecondHeading(
                                  bigText: "Select Question\n",
                                  smallText:
                                      "Lorem ipsum dolor sit amet. consectetuer adipiscing sed\n diam nonummy nibh euismod tincidunt.",
                                ),
                                const SizedBox(height: 32.0),

                                /// Security Question Label
                                const CustomTextFieldLabel(
                                  label: 'Security Question',
                                  labelFontSize: 12.0,
                                ),
                                const SizedBox(height: 8.0),

                                /// Security Question Field
                                CustomDropdownButton(
                                  hintLabel: "example1234",
                                  dropdownMenuItems: _questions,
                                  validation: (String? question) {
                                    // other way to write validation function
                                    return _securityQuestionValidation(
                                      question,
                                    );
                                  },
                                  onChanged: (String? selectedQuestion) {
                                    _userSecurityQuestion = selectedQuestion;
                                  },
                                  onSaved: (String? securityQuestion) {
                                    _userSecurityQuestion = securityQuestion;
                                  },
                                ),
                                const SizedBox(height: 8.0),

                                /// Security Answer Field
                                CustomTextField(
                                  hintText: "Your Answer...",
                                  controller: _securityAnswerController,
                                  keyboardType: TextInputType.text,
                                  autofillHints: const [AutofillHints.name],
                                  textInputAction: TextInputAction.done,
                                  isSuffixIcon: false,
                                  validation: _securityAnswerValidation,
                                  topPadding: 12.0,
                                  bottomPadding: 12.0,
                                  leftPadding: 20.0,
                                  hintTextFontSize: 13.0,
                                  obscureText: false,
                                  onSaved: (String? securityAnswer) {
                                    _userSecurityAnswer = securityAnswer;
                                  },
                                ),
                                const SizedBox(height: 22.0),

                                /// Save & Continue Button
                                CustomButton(
                                  label: 'Get Password',
                                  loginClick: _checkValidation,
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

  void _checkValidation() {
    // If validate then return true and all save() method call
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // If security question match then it return true
      if (_userSecurityQuestion ==
          prefService.getPrefString(
            key: SharedPreferencesServices.kSecurityQue,
          )) {
        // If Answer match then it return true
        if (_userSecurityAnswer ==
            prefService.getPrefString(
              key: SharedPreferencesServices.kSecurityAns,
            )) {
          // Navigate to Next...
        } else {
          // For wrong Que
          _showSnackBar(label: "Selected Question Is Wrong");
        }
      } else {
        // For wrong Ans
        _showSnackBar(label: "Your Answer Is Wrong");
      }
    }
  }

  /// Method to unfocus the keyboard
  void _unfocusKeyboard() {
    FocusScope.of(context).unfocus();
  }

  /// Security Questin Validation
  String? _securityQuestionValidation(question) {
    if (question == null || question.isEmpty) return "Please select the question";
    return null;
  }

  /// Security Answer Validation
  String? _securityAnswerValidation(String? answer) {
    answer = answer?.trim();
    if (answer == null || answer.isEmpty) return "Please enter the answer";
    if (answer.length < 3) return "Answer must be at least 3 characters long";
    if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(answer)) return "Only letters and numbers are allowed";
    return null;
  }

  /// SnackBar Method
  void _showSnackBar({required String label}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextFieldLabel(label: label, labelFontSize: 15.0),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFFfeb64d),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
