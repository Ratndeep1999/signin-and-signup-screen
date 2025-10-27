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

  @override
  void initState(){
    super.initState();
    _initializeControllers();
    _initializeFocusNodes();
  }

  @override
  void dispose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.dispose();
  }

  // Focus nodes for keyboard navigation
  late final FocusNode _firstNameFocus;
  late final FocusNode _lastNameFocus;
  late final FocusNode _emailFocus;
  late final FocusNode _userNameFocus;

  // Controllers
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailAddressController;
  late final TextEditingController _userNameController;

  // Initialize Controllers when the Page Loads
  void _initializeControllers(){
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailAddressController = TextEditingController();
    _userNameController = TextEditingController();
  }

  // Dispose Controllers when the Page Removed from Stack (Dispose)
  void _disposeControllers(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailAddressController.dispose();
    _userNameController.dispose();
  }

  // Initialize FocusNodes when the Page Loads
  void _initializeFocusNodes(){
    _firstNameFocus = FocusNode();
    _lastNameFocus = FocusNode();
    _emailFocus = FocusNode();
    _userNameFocus = FocusNode();
  }

  // Dispose FocusNodes When the Page Removed from Stack (Dispose
  void _disposeFocusNodes() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _userNameFocus.dispose();
  }

  // Parameters
  bool _validUsername = false;
  late String firstName;
  late String lastName;
  late String emailAddress;
  late String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
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
        /// Content Padding
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
                        textInputAction: TextInputAction.next,
                        focusNode: _firstNameFocus,
                        nextFocusNode: _lastNameFocus,
                        autofillHints: [AutofillHints.givenName],
                        obscureText: false,
                        isSuffixIcon: false,
                        controller: _firstName,
                        validation: _firstNameValidation,
                        topPadding: 12.0,
                        bottomPadding: 12.0,
                        leftPadding: 20.0,
                        hintTextFontSize: 13.0,
                        onSaved: (String? firstname) {
                          firstName = firstname!;
                        },
                      ),
                    ),
          
                    SizedBox(width: 10.0),
          
                    /// Last Name Field
                    Flexible(
                      child: CustomTextField(
                        hintText: 'Last Name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        focusNode: _lastNameFocus,
                        nextFocusNode: _emailFocus,
                        autofillHints: [AutofillHints.familyName],
                        obscureText: false,
                        isSuffixIcon: false,
                        controller: _lastName,
                        validation: _lastNameValidation,
                        topPadding: 12.0,
                        bottomPadding: 12.0,
                        leftPadding: 20.0,
                        hintTextFontSize: 13.0,
                        onSaved: (String? lastname) {
                          lastName = lastname!;
                        },
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
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocus,
                  nextFocusNode: _userNameFocus,
                  autofillHints: [AutofillHints.email],
                  isSuffixIcon: true,
                  suffixIcon: Icons.email,
                  obscureText: false,
                  controller: _emailAddress,
                  validation: _emailValidation,
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 13.0,
                  onSaved: (String? email) {
                    emailAddress = email!;
                  },
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
                  textInputAction: TextInputAction.done,
                  focusNode: _userNameFocus,
                  nextFocusNode: null, // close keyboard
                  autofillHints: [AutofillHints.username],
                  isSuffixIcon: true,
                  suffixIcon: _validUsername ? Icons.check_circle : Icons.cancel,
                  suffixIconColor: _validUsername
                      ? Color(0xFF93c743)
                      : Color(0xFFFF4C4C),
                  obscureText: false,
                  controller: _userName,
                  validation: _userNameValidation,
                  topPadding: 12.0,
                  bottomPadding: 12.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14.0,
                  onChanged: _onChangedUsername,
                  onSaved: (String? username) {
                    userName = username!;
                  },
                ),
                const SizedBox(height: 22.0),
          
                /// Save & Continue Button
                CustomButton(
                  label: 'Save & Continue',
                  loginClick: () {
                    /// If Details is valid then Next..
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
    );
  }

  /// It Validate all Fields
  void _checkValidation() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      // This triggers all onSaved methods
      _formKey.currentState!.save();
      _savedData();
      // Navigate to Next Screen
      _navigateToSignupSecondScreen();
    }
  }

  /// Check Saved Data
  _savedData() {
    debugPrint('First Name: $firstName');
    debugPrint('Last Name: $lastName');
    debugPrint('Email Address: $emailAddress');
    debugPrint('UserName: $userName');
  }

  /// Navigate to signup second screen
  void _navigateToSignupSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SignupSecondScreen();
        },
      ),
    );
  }

  /// First Name Validation
  String? _firstNameValidation(String? firstName) {
    firstName = firstName?.trim();
    if (firstName == null || firstName.isEmpty) {
      return 'Enter your first name';
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
      return 'Enter your last name';
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

  /// Username live Validation check
  void _onChangedUsername(String username) {
    // remove any spaces
    username = username.trim();

    // allows letters, numbers, underscores and at least 4 chars
    final bool isValidPattern = RegExp(r'^[a-zA-Z0-9_]{4,}$').hasMatch(username);

    // Check if username equals other fields
    final bool isDifferentFromOthers =
        username != _firstName.text.trim() &&
            username != _lastName.text.trim() &&
            username != _emailAddress.text.trim();

    // Final condition: valid pattern AND not same as other fields
    final bool isValid = isValidPattern && isDifferentFromOthers;

    setState(() {
      _validUsername = isValid;
    });
  }

}
