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
  const SignupFirstScreen({super.key});

  @override
  State<SignupFirstScreen> createState() => _SignupFirstScreenState();
}

class _SignupFirstScreenState extends State<SignupFirstScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailAddressController;
  late final TextEditingController _userNameController;

  late final FocusNode _firstNameFocus;
  late final FocusNode _lastNameFocus;
  late final FocusNode _emailFocus;
  late final FocusNode _userNameFocus;

  bool _isValidUsername = false;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _userName;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailAddressController = TextEditingController();
    _userNameController = TextEditingController();
    _firstNameFocus = FocusNode();
    _lastNameFocus = FocusNode();
    _emailFocus = FocusNode();
    _userNameFocus = FocusNode();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailAddressController.dispose();
    _userNameController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _userNameFocus.dispose();
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
          onTap: () => FocusScope.of(context).unfocus(),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: AutofillGroup(
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

                /// First and Last Name
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /// First Name Field
                    Flexible(
                      child: CustomTextField(
                        hintText: 'First Name',
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                        validation: _firstNameValidation,
                        textInputAction: TextInputAction.next,
                        focusNode: _firstNameFocus,
                        nextFocusNode: _lastNameFocus,
                        autofillHints: [AutofillHints.givenName],
                        topPadding: 12.0,
                        bottomPadding: 12.0,
                        leftPadding: 20.0,
                        hintTextFontSize: 13.0,
                        onSaved: (String? firstname) => _firstName = firstname!,
                      ),
                    ),
                    const SizedBox(width: 10.0),

                    /// Last Name Field
                    Flexible(
                      child: CustomTextField(
                        hintText: 'Last Name',
                        keyboardType: TextInputType.name,
                        controller: _lastNameController,
                        validation: _lastNameValidation,
                        textInputAction: TextInputAction.next,
                        focusNode: _lastNameFocus,
                        nextFocusNode: _emailFocus,
                        autofillHints: [AutofillHints.familyName],
                        topPadding: 12.0,
                        bottomPadding: 12.0,
                        leftPadding: 20.0,
                        hintTextFontSize: 13.0,
                        onSaved: (String? lastname) => _lastName = lastname!,
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
                  controller: _emailAddressController,
                  validation: _emailValidation,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocus,
                  nextFocusNode: _userNameFocus,
                  autofillHints: [AutofillHints.email],
                  isSuffixIcon: true,
                  suffixIcon: Icons.email,
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 13.0,
                  onSaved: (String? email) => _email = email!,
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
                  controller: _userNameController,
                  validation: _userNameValidation,
                  textInputAction: TextInputAction.done,
                  focusNode: _userNameFocus,
                  autofillHints: [AutofillHints.username],
                  isSuffixIcon: true,
                  suffixIcon: _isValidUsername
                      ? Icons.check_circle
                      : Icons.cancel,
                  suffixIconColor: _isValidUsername
                      ? Color(0xFF93c743)
                      : Color(0xFFFF4C4C),
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14.0,
                  onChanged: _onChangedUsername,
                  onSaved: (String? username) => _userName = username!,
                ),
                const SizedBox(height: 22.0),

                /// Save & Continue Button
                CustomButton(
                  label: 'Save & Continue',
                  buttonPress: _saveAndContinue,
                ),
                const SizedBox(height: 20.0),

                /// Back to Login text Button
                CustomClickableText(
                  label: 'Back to Login',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// It Validate all Fields
  void _saveAndContinue() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SignupSecondScreen(
          fullName: "$_firstName $_lastName",
          emailAddress: _email,
          userName: _userName,
        ),
      ),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Data Saved")));
  }

  /// Username live Validation check
  void _onChangedUsername(String username) {
    username = username.trim();
    // is userName match the pattern
    final bool isValidPattern = RegExp(
      r'^[a-zA-Z0-9_]{4,}$',
    ).hasMatch(username);

    // Check if username equals other fields or not
    final bool isDifferentFromOthers =
        username != _emailAddressController.text.trim() &&
        username != _firstNameController.text.trim() &&
        username != _lastNameController.text.trim();

    // Final check isValid and notSameAsOthers
    final bool isValid = isValidPattern && isDifferentFromOthers;

    setState(() => _isValidUsername = isValid);
  }

  /// First Name Validation
  String? _firstNameValidation(String? firstName) {
    firstName = firstName?.trim();
    if (firstName == null || firstName.isEmpty) return 'Enter your first name';
    if (firstName.length < 2) return 'Name is too short';
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(firstName)) {
      return 'Please enter letters only';
    }
    return null;
  }

  /// Last Name Validation
  String? _lastNameValidation(String? lastName) {
    lastName = lastName?.trim();
    if (lastName == null || lastName.isEmpty) return 'Enter your last name';
    if (lastName.length < 4) return 'Name is too short';
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(lastName)) {
      return 'Please enter letters only';
    }
    return null;
  }

  /// Email Validation Method
  String? _emailValidation(String? email) {
    email = email?.trim().toLowerCase();
    if (email == null || email.isEmpty) return 'Please enter your email';
    if (email.contains(' ')) return 'Space is not allow';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
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
    if (userName.length < 4) return 'Username is too short';
    if ([
      _emailAddressController.text,
      _firstNameController.text,
      _lastNameController.text,
    ].contains(userName)) {
      return "Username need to be different from others";
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(userName)) {
      return 'Only letters, numbers, and underscores are allowed';
    }
    // if (_takenUsernames.contains(userName)) {
    //   return 'Username is already taken';
    // }
    return null;
  }
}
