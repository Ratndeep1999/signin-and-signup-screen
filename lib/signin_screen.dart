import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_helping_clickable_text.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field_label.dart';
import 'package:signin_and_signup_screens/home_screen.dart';
import 'package:signin_and_signup_screens/signup_first_screen.dart';
import 'Custom Widgets/custom_button.dart';
import 'Custom Widgets/custom_clickable_text.dart';
import 'Custom Widgets/custom_heading.dart';
import 'Custom Widgets/custom_second_heading.dart';
import 'Custom Widgets/custom_text_field.dart';
import 'Custom Widgets/custom_clipping_design.dart';

class SigningScreen extends StatefulWidget {
  const SigningScreen({super.key});

  @override
  State<SigningScreen> createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {
  // object of shared preferences
  late final SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    _initializeSharedPrefs();
  }

  @override
  void dispose(){
    _emailAddress.clear();
    _password.clear();
    _passwordFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  /// It will Initialize Shared Preferences
  void _initializeSharedPrefs() async{
    prefs = await SharedPreferences.getInstance();
    debugPrint("Shred Preferences Initialize");
    _printSavedPrefs();
  }

  // Focus nodes for keyboard navigation
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  // show or hide input text
  bool _obscureText = true;

  // save password
  bool _savePassword = false;

  // controllers
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // formKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This stops content from moving
      // resizeToAvoidBottomInset: false,
      /// Appbar
      appBar: AppBar(backgroundColor: Color(0xFFefb744)),

      /// Body
      body: SingleChildScrollView(
        child: InkWell(
          /// Method to Disable Hardware Keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SafeArea(
            child: Stack(
              children: [
                /// Background Custom Design
                const CustomClippingDesign(),

                /// Vertical Widget
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Heading Text
                    CustomHeading(
                      bigText: "Hello\n",
                      smallText: "Welcome Back!",
                    ),
                    const SizedBox(height: 40),

                    /// Main Card Section
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
        child: AutofillGroup(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// 2nd Heading
                CustomSecondHeading(
                  bigText: "Login Account\n",
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
                  controller: _emailAddress,
                  validation: _emailValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocus,
                  nextFocusNode: _passwordFocus,
                  autofillHints: [AutofillHints.email],
                ),
                const SizedBox(height: 26.0),

                /// Password Label
                const CustomTextFieldLabel(
                  label: 'Password',
                  labelFontSize: 15.0,
                ),
                const SizedBox(height: 8.0),

                /// Password Field
                CustomTextField(
                  hintText: "Enter Your Password",
                  keyboardType: TextInputType.visiblePassword,
                  isSuffixIcon: true,
                  suffixIcon: _obscureText ? Icons.lock : Icons.lock_open,
                  obscureText: _obscureText,
                  suffixTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  controller: _password,
                  validation: _passwordValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocus,
                  nextFocusNode: null,
                  autofillHints: [AutofillHints.password],
                ),
                const SizedBox(height: 24.0),

                /// Save Password and Forgot Password Section
                CustomHelpingClickableText(
                  onTap: () {
                    setState(() {
                      _savePassword = !_savePassword;
                    });
                  },
                  savePassword: _savePassword,
                ),
                const SizedBox(height: 24.0),

                /// Login Button
                CustomButton(
                  label: 'Login Account',
                  loginClick: () {
                    /// If Details is valid then Login..
                    FocusScope.of(context).unfocus();
                    _loginLogic();
                  },
                ),
                const SizedBox(height: 25.0),

                /// Create Account text Button
                CustomClickableText(
                  label: 'Create New Account',
                  onTap: () {
                    _navigateToSignupFirstScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// It will print the Saved data from from Prefs
  void _printSavedPrefs() {
    debugPrint('Full Name- ${prefs.getString('fullName')}');
    debugPrint('Email Address- ${prefs.getString('emailId')}');
    debugPrint('UserName- ${prefs.getString('userName')}');
    debugPrint('Birthday- ${prefs.getString('birthday')}');
    debugPrint('Password- ${prefs.getString('password')}');
    debugPrint('Phone Number- ${prefs.getString('phoneNumber')}');
    debugPrint('Security Question- ${prefs.getString('securityQue')}');
    debugPrint('Security Answer- ${prefs.getString('securityAns')}');
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

  /// Navigate to signup first screen
  void _navigateToSignupFirstScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupFirstScreen()),
    );
  }

  /// Login Logic
  void _loginLogic() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _showSnackBar(label: 'Login....Please wait');
      Future.delayed(Duration(seconds: 3), () {
        _navigateToHomeScreen();
      });
    } else {}
  }

  /// Navigation to Home Screen
  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }
}
