import 'package:flutter/material.dart';

class CustomHelpingClickableText extends StatelessWidget {
  const CustomHelpingClickableText({
    super.key,
    required this.savePassword,
    required this.onTap,
  });

  final bool savePassword;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        /// Save Password Custom Checkbox
        buildSavePassword(),
        SizedBox(width: 8.0),

        /// Label of Forget Password
        buildSavePasswordLabel('Save Password'),
        Spacer(),

        /// Forgot Password
        buildForgetPassword('Forgot Password?'),
      ],
    );
  }

  /// SavePassword Label Widget
  Text buildSavePasswordLabel(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    );
  }

  /// ForgetPassword Widget
  InkWell buildForgetPassword(String clickableLabel) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      child: Text(
        clickableLabel,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.bold,
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
        onTap();
      },
      splashColor: Colors.transparent,
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        radius: 10.5,
        child: CircleAvatar(
          radius: 10.0,
          backgroundColor: savePassword ? Color(0xFF93c743) : Color(0xFFF7F0FA),
          child: Visibility(
            visible: savePassword,
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
