import 'package:flutter/material.dart';

class CustomBirthdayDropdownButton extends StatelessWidget {
  const CustomBirthdayDropdownButton({
    super.key,
    required this.hintLabel,
    required this.dropdownMenuItems,
    required this.onChanged,
  });

  final String hintLabel;
  final List<DropdownMenuItem<String>> dropdownMenuItems;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // Hint label
      hint: Text(
        hintLabel,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: const SizedBox.shrink(),
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 22,
          color: Colors.black45,
        ),
        // Text and icon width
        suffixIconConstraints: BoxConstraints(minWidth: 22.0),
        errorStyle: TextStyle(
          color: Color(0xFFefb744),
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        // Borders
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ), // default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ), // active border color
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent), // error state
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      items: dropdownMenuItems,
      onChanged: onChanged,
    );
  }
}
