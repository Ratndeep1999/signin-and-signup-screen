import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    required this.obscureText,
    required this.dynamicSuffixIcon,
    this.suffixTap,
    required this.textController,
    required this.validation,
  });

  // Attributes
  TextEditingController textController = TextEditingController();
  final TextInputType keyboardType;
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool dynamicSuffixIcon;
  final VoidCallback? suffixTap;

  // Fun. return type   Function(value of the text field might be null) variable
  final String? Function(String?)? validation; // type definition

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validation,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      // Input Text Style
      style: TextStyle(),

      decoration: InputDecoration(
        // hintText
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12.0,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        hintMaxLines: 1,
        errorStyle: TextStyle(color: Color(0xFFefb744)),
        // padding of hintText
        contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0),
        // suffixIcon it can be clickable using dynamicSuffixIcon
        suffixIcon: dynamicSuffixIcon
            ? IconButton(
                // suffixIcon it can be null
                icon: Icon(suffixIcon, size: 20),
                onPressed: suffixTap,
                splashRadius: 5,
                highlightColor: Colors.transparent,
              )
            : Icon(suffixIcon, size: 20),
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
