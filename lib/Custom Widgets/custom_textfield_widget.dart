import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  CustomTextfieldWidget({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.obscureText,
    required this.dynamicSuffixIcon,
    this.suffixTap,
    required this.textController,
  });

  // Attributes
  TextEditingController textController = TextEditingController();
  final TextInputType keyboardType;
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool dynamicSuffixIcon;
  final VoidCallback? suffixTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      // Input Text Style
      style: TextStyle(),
      decoration: InputDecoration(
        // hintText
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        // padding of hintText
        contentPadding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.black12, width: 1.0), // default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.black12, width: 2.0), // active border color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0), // error state
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
        ),
        // suffixIcon it can be clickable using dynamicSuffixIcon
        suffixIcon: dynamicSuffixIcon
            ? IconButton(
                // suffixIcon it can be null
                icon: Icon(suffixIcon),
                onPressed: suffixTap,
                splashRadius: 5,
                highlightColor: Colors.transparent,
              )
            : Icon(suffixIcon),
        suffixIconColor: Colors.black54,
        // min right padding of icon
        suffixIconConstraints: BoxConstraints(minWidth: 80.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
