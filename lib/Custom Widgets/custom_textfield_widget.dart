import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Your Email Address",
        hintStyle: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 28.0,
          vertical: 16.0,
        ),
        suffixIcon: Icon(Icons.person),
        suffixIconColor: Colors.black54,
        suffixIconConstraints: BoxConstraints(
          minWidth: 80.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}