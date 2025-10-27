import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required this.onChanged,
    required this.suffixIcon,
    required this.suffixIconColor,
    required this.validation,
    required this.controller,
    this.focusNode,
    this.textInputAction,
    this.nextFocusNode,
    this.onSaved,
  });

  final TextEditingController controller;
  final ValueChanged<PhoneNumber>? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validation;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final IconData suffixIcon;
  final Color suffixIconColor;

  // For focus node
  final TextInputAction? textInputAction;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      keyboardType: TextInputType.phone,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      initialCountryCode: 'IN',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validation,
      // dropdown
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 20,
        color: Colors.black54,
      ),
      dropdownTextStyle: TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      disableLengthCheck: true,
      // input phone number style
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        // hint text
        hint: Text(
          "1234 5678 9101",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        errorStyle: TextStyle(
          color: Color(0xFFefb744),
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        // padding of hintText
        contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0),
        suffixIcon: Icon(suffixIcon, size: 18),
        suffixIconColor: suffixIconColor,
        suffixIconConstraints: BoxConstraints(minWidth: 80.0),
        // borders
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
