import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_helping_clickable_text.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_text_field_label.dart';
import 'package:signin_and_signup_screens/Forgot%20Password%20Section/validate_email_screen.dart';
import 'package:signin_and_signup_screens/Shared%20Preferences/shared_preferences_service.dart';
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
  // Object of shared preferences
  SharedPreferencesServices prefServices = SharedPreferencesServices();

  // Focus nodes for keyboard navigation
  late final FocusNode _passwordFocus;
  late final FocusNode _emailFocus;

  // Controllers
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailAddressController;
  late final TextEditingController _passwordController;

  // Parameters
  bool _obscureText = true;
  bool _savePassword = false;
  String? _emailAddress;
  String? _password;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeFocusNodes();
    prefServices.printSavedPrefs();
    // debugPrint("Signing screen initState() method call");
  }

  @override
  void dispose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.dispose();
  }

  /// Initialize Controller
  void _initializeControllers() {
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  /// Dispose controller
  void _disposeControllers() {
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  /// Initialize FocusNodes
  void _initializeFocusNodes() {
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  /// Dispose FocusNode
  void _disposeFocusNodes() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }

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
                  controller: _emailAddressController,
                  validation: _emailValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocus,
                  nextFocusNode: _passwordFocus,
                  autofillHints: [AutofillHints.email],
                  onSaved: (String? emailAddress) {
                    _emailAddress = emailAddress;
                  },
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
                  controller: _passwordController,
                  validation: _passwordValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocus,
                  nextFocusNode: null,
                  autofillHints: [AutofillHints.password],
                  onSaved: (String? password) {
                    _password = password;
                  },
                ),
                const SizedBox(height: 24.0),

                /// Save Password and Forgot Password Section
                CustomHelpingClickableText(
                  onTapPassword: () {
                    setState(() {
                      _savePassword = !_savePassword;
                    });
                  },
                  savePassword: _savePassword,
                  onTapForgotPassword: _navigateToForgotPasswordSection,
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

                /// Create New Account text Button
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

  /// Login Logic
  void _loginLogic() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();

      // Check Credentials
      String? dbEmailId = prefServices.getPrefString(
        key: SharedPreferencesServices.kEmailId,
      );
      String? dbPassword = prefServices.getPrefString(
        key: SharedPreferencesServices.kPassword,
      );

      // Checks is Account Exists if Not then return Null
      if (dbEmailId != null || dbPassword != null) {
        // If Credentials Exists then match with Database
        if (dbEmailId == _emailAddress && dbPassword == _password) {
          prefServices.setPrefBool(
            key: SharedPreferencesServices.kIsUserLoggedIn,
            value: true,
          );
          _showSnackBar(label: 'Login....Please wait');
          Future.delayed(Duration(seconds: 3), () {
            _navigateToHomeScreen();
          });
        } else {
          // If Credentials not match with Database
          _showSnackBar(label: 'Invalid email or password.');
        }
      } else {
        // If dbEmailId and dbPassword is null
        _showSnackBar(label: 'Account not found. Please sign up first.');
      }
    }
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

  /// Navigate to Forgot password Section
  void _navigateToForgotPasswordSection() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => ValidateEmailScreen()));
  }
}
