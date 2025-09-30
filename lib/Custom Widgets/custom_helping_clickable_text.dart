import 'package:flutter/material.dart';

class CustomHelpingClickableText extends StatelessWidget {
  const CustomHelpingClickableText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Save Password Custom Checkbox
        buildSavePassword(),
        SizedBox(width: 8.0),

        /// Label of Forget Password
        Text(
          'Save Password',
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w800,
          ),
        ),

        Spacer(),

        /// Forgot Password
        buildForgetPassword(),
      ],
    );
  }

  /// ForgetPassword Widget
  InkWell buildForgetPassword() {
    return InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.underline,
            decorationThickness: 2.0,
          ),
        ),
      );
  }

  /// SavePassword Widget
  Widget buildSavePassword() {
    return InkWell(
        onTap: () {
          setState(() {
            _savePassword = !_savePassword;
          });
        },
        splashColor: Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.black26,
          radius: 10.5,
          child: CircleAvatar(
            radius: 10.0,
            backgroundColor: _savePassword
                ? Color(0xFF93c743)
                : Color(0xFFF7F0FA),
            child: Visibility(
              visible: _savePassword,
              child: Icon(
                Icons.check,
                size: 16.0,
                color: Colors.white,
                weight: 50,
              ),
            ),
          ),
        ),
      );
  }
}
