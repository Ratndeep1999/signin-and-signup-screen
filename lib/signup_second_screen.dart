import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_phone_number_field.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_security_question_field.dart';
import 'Custom Widgets/custom_birthday_dropdown_button.dart';
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

  // Focus Nodes
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _securityAnswerFocus = FocusNode();

  // Form key and Controllers
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
  String? _selectedSecurityQuestion = "";

  // show or hide input text
  bool _obscureText = false;

  // check number is valid or not
  bool _isPhoneNumberValid = false;

  // For Birthday
  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;

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
                          SizedBox(
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  /// Days
                                  SizedBox(
                                    width: 50,
                                    child: CustomBirthdayDropdownButton(
                                      hintLabel: "Day",
                                      dropdownMenuItems: _generateDays(),
                                      onChanged: (String? day) {
                                        debugPrint("Selected day: $day");
                                        _selectedDay = day;
                                      },
                                      //onSaved: (){},
                                    ),
                                  ),

                                  /// Months
                                  SizedBox(
                                    width: 65,
                                    child: CustomBirthdayDropdownButton(
                                      hintLabel: "Month",
                                      dropdownMenuItems: _generateMonths(),
                                      onChanged: (String? month) {
                                        debugPrint("Selected day: $month");
                                        _selectedMonth = month;
                                      },
                                      //onSaved: ,
                                    ),
                                  ),

                                  /// Years
                                  SizedBox(
                                    width: 63,
                                    child: CustomBirthdayDropdownButton(
                                      hintLabel: "Year",
                                      dropdownMenuItems: _generateYears(),
                                      onChanged: (String? year) {
                                        debugPrint("Selected day: $year");
                                        _selectedYear = year;
                                      },
                                      //onSaved: ,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),

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
                              debugPrint("Hello: ${number.completeNumber}");
                              _onChangedPhoneNumber(number.number);
                            },
                            validation: (PhoneNumber? number) {
                              debugPrint("abc: $number");
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
                          CustomDropdownButton(
                            hintLabel: "example1234",
                            dropdownMenuItems: questions,
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
                              _birthdayValidation();
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

  /// Birthday Validation
  Function? _birthdayValidation() {
    if (_selectedDay == null ||
        _selectedMonth == null ||
        _selectedYear == null) {
      _showBirthdateDialog();
    }
    return null;
  }

  /// Alert Dialog for Birthday Validation
  void _showBirthdateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5.0,
          title: Text(
            "Missing Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          actionsPadding: EdgeInsets.only(bottom: 8.0, right: 16.0),
          content: Text(
            "Please select your birth date before proceeding.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // close dialog
              child: Text(
                "OK",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFefb744),
                ),
              ),
            ),
          ],
        );
      },
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

  /// Security Questin Validation
  String? _securityQuestionValidation(question) {
    if (question == null || question.isEmpty) {
      return "Please select the question";
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

  /// Generates Days
  List<DropdownMenuItem<String>> _generateDays() {
    return List.generate(
      31,
      (index) => "${index + 1}",
    ).map((day) => _dropdownMenuItem(day)).toList();
  }

  /// Generates Months
  List<DropdownMenuItem<String>> _generateMonths() {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months.map((month) => _dropdownMenuItem(month)).toList();
  }

  /// Generate Years
  List<DropdownMenuItem<String>> _generateYears() {
    return List.generate(
      100,
      (index) => '${2025 - index}',
    ).map((year) => _dropdownMenuItem(year)).toList();
  }

  /// Generate DropdownMenuItems
  DropdownMenuItem<String> _dropdownMenuItem(String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
