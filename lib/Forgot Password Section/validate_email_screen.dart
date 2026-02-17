import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/custom_clipping_design.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';
import 'package:signin_and_signup_screens/Forgot%20Password%20Section/validate_answer_screen.dart';
import '../Custom Widgets/custom_button.dart';
import '../Custom Widgets/custom_clickable_text.dart';
import '../Custom Widgets/custom_heading.dart';
import '../Custom Widgets/custom_second_heading.dart';
import '../Custom Widgets/custom_text_field.dart';
import '../Custom Widgets/custom_text_field_label.dart';

class ValidateEmailScreen extends StatefulWidget {
  const ValidateEmailScreen({super.key});

  @override
  State<ValidateEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<ValidateEmailScreen> {
  final DBTable dbService = DBTable();
  late final TextEditingController _emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  controller: _emailController,
                  validation: _emailValidation,
                  topPadding: 15.0,
                  bottomPadding: 15.0,
                  leftPadding: 20.0,
                  hintTextFontSize: 14,
                  textInputAction: TextInputAction.next,
                  autofillHints: [AutofillHints.email],
                ),
                const SizedBox(height: 22.0),

                /// Check Email Button
                CustomButton(
                  label: 'Check Email',
                  buttonPress: () => _checkValidation(),
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

  /// Email Validation Method
  String? _emailValidation(String? email) {
    email = email?.trim().toLowerCase();
    if (email == null || email.isEmpty) return 'Please enter your email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      return "Email address must contain '@' and '.com'";
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

  /// Check user email in Database
  Future<void> _checkValidation() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;
    final email = _emailController.text.trim().toLowerCase();

    final user = await dbService.getUserByEmail(email);

    if (user == null) {
      _showSnackBar(label: "Email Not Found");
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            ValidateAnswerScreen(userId: user[DBTable.kId] as int),
      ),
    );
  }
}
