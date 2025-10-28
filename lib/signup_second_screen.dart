import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_phone_number_field.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_security_question_field.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
import 'Custom Widgets/custom_birthday_dropdown_button.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field.dart';
import 'Custom Widgets/custom_text_field_label.dart';

class SignupSecondScreen extends StatefulWidget {
  // To get data from previous page
  final String fullName;
  final String emailAddress;
  final String userName;

  const SignupSecondScreen({
    super.key,
    required this.fullName,
    required this.emailAddress,
    required this.userName,
  });

  @override
  State<SignupSecondScreen> createState() => _SignupSecondScreenState();
}

class _SignupSecondScreenState extends State<SignupSecondScreen> {
  // Focus Nodes
  late final FocusNode _passwordFocus;
  late final FocusNode _securityAnswerFocus;
  late final FocusNode _phoneNumberFocus;

  // Form key and Controllers
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _securityAnswerController;
  late final TextEditingController _phoneNumberController;

  // Shared Preferences object
  late final SharedPreferencesServices prefServices;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeFocusNodes();
    _initializedSharedPref();
    // It initialize data from previous screen
    _fullName = widget.fullName;
    _emailAddress = widget.emailAddress;
    _userName = widget.userName;
  }

  @override
  void dispose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.dispose();
  }

  // Shared Preferences initialize method
  Future<void> _initializedSharedPref() async {
    prefServices.initializeSharedPref();
    debugPrint("SharedPreferences initialized");
  }

  // Initialize Controllers when the Page Loads
  void _initializeControllers() {
    _passwordController = TextEditingController();
    _securityAnswerController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  // Dispose Controllers when the Page Removed from Stack (Dispose)
  void _disposeControllers() {
    _passwordController.dispose();
    _securityAnswerController.dispose();
    _phoneNumberController.dispose();
  }

  // Initialize FocusNodes when the Page Loads
  void _initializeFocusNodes() {
    _passwordFocus = FocusNode();
    _securityAnswerFocus = FocusNode();
    _phoneNumberFocus = FocusNode();
  }

  // Dispose FocusNodes when the Page Removed from Stack (Dispose)
  void _disposeFocusNodes() {
    _passwordFocus.dispose();
    _securityAnswerFocus.dispose();
    _phoneNumberFocus.dispose();
  }

  // Security Questions
  final List<String> questions = [
    'What is your pet’s name?',
    'What is your mother’s maiden name?',
    'What was your first school?',
    'What is your favorite color?',
    'What city were you born in?',
  ];
  bool _obscureText = true;
  bool _isPhoneNumberValid = false;

  // Parameters
  late String _fullName;
  late String _emailAddress;
  late String _userName;
  late String _birthDate;
  late String _password;
  late String _phoneNumber;
  late String _securityQuestion;
  late String _securityAnswer;

  // For Birthday
  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20.0,
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
                buildCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Refactored Card method
  Card buildCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      elevation: 5.0,
      child: Padding(
        /// Content Padding
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        child: AutofillGroup(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// 2nd Heading
                const CustomSecondHeading(
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
                      border: Border.all(color: Colors.black12, width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /// Days
                        SizedBox(
                          width: 50,
                          child: CustomBirthdayDropdownButton(
                            hintLabel: "Day",
                            dropdownMenuItems: _generateDays(),
                            onChanged: (String? day) {
                              _selectedDay = day;
                            },
                          ),
                        ),

                        /// Months
                        SizedBox(
                          width: 65,
                          child: CustomBirthdayDropdownButton(
                            hintLabel: "Month",
                            dropdownMenuItems: _generateMonths(),
                            onChanged: (String? month) {
                              _selectedMonth = month;
                            },
                          ),
                        ),

                        /// Years
                        SizedBox(
                          width: 63,
                          child: CustomBirthdayDropdownButton(
                            hintLabel: "Year",
                            dropdownMenuItems: _generateYears(),
                            onChanged: (String? year) {
                              _selectedYear = year;
                            },
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
                  autofillHints: [AutofillHints.newPassword],
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.next,
                  nextFocusNode: _phoneNumberFocus,
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
                  controller: _passwordController,
                  validation: _passwordValidation,
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 13.0,
                  onSaved: (String? password) {
                    _password = password ?? '';
                  },
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
                  textInputAction: TextInputAction.next,
                  focusNode: _phoneNumberFocus,
                  nextFocusNode: _securityAnswerFocus,
                  suffixIcon: _isPhoneNumberValid
                      ? Icons.check_circle
                      : Icons.cancel,
                  suffixIconColor: _isPhoneNumberValid
                      ? Color(0xFF93c743)
                      : Color(0xFFFF4C4C),
                  controller: _phoneNumberController,
                  onChanged: (PhoneNumber number) {
                    // debugPrint("Phone Number: ${number.completeNumber}");
                    // Phone Number: +918551830830
                    _onChangedPhoneNumber(number.number);
                  },
                  validation: _phoneNumberValidation,
                  onSaved: (PhoneNumber? phoneNumber) {
                    // Phone no: PhoneNumber(countryISOCode: IN, countryCode: +91, number: 8551830830)
                    _phoneNumber =
                        ("${phoneNumber!.countryISOCode}  ${phoneNumber.countryCode} ${phoneNumber.number}");
                  },
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
                  validation: (String? question) {
                    // other way to write validation function
                    return _securityQuestionValidation(question);
                  },
                  onChanged: (String? selectedQuestion) {
                    _securityQuestion = selectedQuestion!;
                  },
                  onSaved: (String? securityQuestion) {
                    _securityQuestion = securityQuestion!;
                  },
                ),
                const SizedBox(height: 8.0),

                /// Security Answer Field
                CustomTextField(
                  hintText: "Your Answer...",
                  controller: _securityAnswerController,
                  keyboardType: TextInputType.text,
                  autofillHints: const [AutofillHints.name],
                  focusNode: _securityAnswerFocus,
                  textInputAction: TextInputAction.done,
                  isSuffixIcon: false,
                  validation: _securityAnswerValidation,
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 13.0,
                  obscureText: false,
                  onSaved: (String? securityAnswer) {
                    _securityAnswer = securityAnswer!;
                  },
                ),
                const SizedBox(height: 22.0),

                /// Save & Continue Button
                CustomButton(
                  label: 'Save & Continue',
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
    );
  }

  /// Check Saved Data
  void _printSavedData() {
    debugPrint('Full Name: $_fullName');
    debugPrint('Email Address: $_emailAddress');
    debugPrint('UserName: $_userName');
    debugPrint('Birthday: $_birthDate');
    debugPrint('Password: $_password');
    debugPrint('Phone Number: $_phoneNumber');
    debugPrint('Security Question: $_securityQuestion');
    debugPrint('Security Answer: $_securityAnswer');
  }

  /// Save User Signup data to Shared Preferences
  Future<void> _saveUserSignupPrefs() async {
    await prefServices.setPrefString(key: SharedPreferencesServices.kFullName, value: _fullName);
    await prefServices.setPrefString(key: SharedPreferencesServices.kEmailId, value: _emailAddress);
    await prefServices.setPrefString(key: SharedPreferencesServices.kUserName, value: _userName);
    await prefServices.setPrefString(key: SharedPreferencesServices.kBirthday, value: _birthDate);
    await prefServices.setPrefString(key: SharedPreferencesServices.kPassword, value: _password);
    await prefServices.setPrefString(key: SharedPreferencesServices.kPhoneNumber, value: _phoneNumber);
    await prefServices.setPrefString(key: SharedPreferencesServices.kSecurityQue, value: _securityQuestion);
    await prefServices.setPrefString(key: SharedPreferencesServices.kSecurityAns, value: _securityAnswer);
  }

  /// Check all validations
  Future<void> _checkValidation() async {
    // Validate the form fields
    if (_formKey.currentState!.validate() && _isPhoneNumberValid && _birthdayValidation()) {
      _formKey.currentState!.save();
      _printSavedData();
      await _saveUserSignupPrefs();
      _navigateToSigningScreen();
    } else {}
  }

  /// Birthday Validation
  bool _birthdayValidation() {
    if (_selectedDay == null ||
        _selectedMonth == null ||
        _selectedYear == null) {
      _showBirthdateDialog();
      return false;
    } else {
      _birthDate = ("$_selectedDay $_selectedMonth $_selectedYear");
      // If Birthday is valid, then proceed
      return true;
    }
  }

  /// Navigate to Signing Screen
  void _navigateToSigningScreen() {
    // Direct navigate to First Page of Stack and Remove all Pages
    Navigator.popUntil(context, (route) => route.isFirst);
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
    if (password == null || password.isEmpty) return "Please enter your password";
    if (password.length < 8) return "Password must be at least 8 characters";
    if (password.contains(' ')) return "Space is not allowed";
    if (!RegExp(r'[A-Z]').hasMatch(password)) return "Must contain uppercase letter";
    if (!RegExp(r'[a-z]').hasMatch(password)) return "Must contain lowercase letter";
    if (!RegExp(r'[0-9]').hasMatch(password)) return "Must contain a number";
    if (!RegExp(r'[!@\$&*~_]').hasMatch(password)) return "Must contain special character (!@#\$&*~_)";
    return null;
  }

  /// Phone Number Validation
  String? _phoneNumberValidation(PhoneNumber? number) {
    final phone = number?.number.trim();
    if (phone == null || phone.isEmpty) return "Please enter your phone number";
    if (phone.length != 10) return "Mobile number must be 10 digits";
    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) return "Only numbers are allowed";
    return null;
  }

  /// Phone Number live Validation Check
  void _onChangedPhoneNumber(String phoneNumber) {
    final bool isValid =
        phoneNumber.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phoneNumber);
    setState(() {
      _isPhoneNumberValid = isValid;
    });
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
