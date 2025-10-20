import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.obscureText,
    required this.isSuffixIcon,
    this.suffixTap,
    required this.textController,
    required this.validation,
    required this.topPadding,
    required this.bottomPadding,
    required this.leftPadding,
    required this.hintTextFontSize,
    this.suffixIconColor,
    this.onChanged
  });

  // Attributes
  TextEditingController textController = TextEditingController();
  final TextInputType keyboardType;
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool isSuffixIcon;
  final VoidCallback? suffixTap;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double hintTextFontSize;
  final Color? suffixIconColor;

  final ValueChanged<String>? onChanged;

  // Fun. return type   Function(value of the text field might be null) variable
  final String? Function(String?)? validation; // type definition

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validation,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      // Input Text Style
      style: TextStyle(),
      decoration: InputDecoration(
        // hintText
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintTextFontSize,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        hintMaxLines: 1,
        errorStyle: TextStyle(
          color: Color(0xFFefb744),
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        // padding of hintText
        contentPadding: EdgeInsets.only(
          top: topPadding,
          bottom: bottomPadding,
          left: leftPadding,
        ),
        // SuffixIcon it can be clickable using suffixTap
        suffixIcon: isSuffixIcon
            ? IconButton(
                // suffixIcon it can be null
                icon: Icon(suffixIcon, size: 20, color: suffixIconColor),
                onPressed: suffixTap,
                splashRadius: 5,
                highlightColor: Colors.transparent,
              )
            : null,
        suffixIconColor: Colors.black54,
        // min right padding of icon
        suffixIconConstraints: BoxConstraints(minWidth: 80.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ), // default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2.0,
          ), // active border color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: Color(0xFFefb744),
            width: 2.0,
          ), // error state
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Color(0xFFefb744), width: 2.0),
        ),
      ),
    );
  }
}
