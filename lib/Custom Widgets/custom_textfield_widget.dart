import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    required this.dynamicSuffixIcon,
  });

  // Attributes
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool dynamicSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        // hintText
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        // padding of hintText
        contentPadding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
        // suffixIcon it can be clickable using dynamicSuffixIcon
        suffixIcon: dynamicSuffixIcon
            ? IconButton(onPressed: () {}, icon: Icon(suffixIcon))
            : Icon(suffixIcon),
        suffixIconColor: Colors.black54,
        // min right padding of icon
        suffixIconConstraints: BoxConstraints(minWidth: 80.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
