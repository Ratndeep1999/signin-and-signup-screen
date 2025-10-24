import 'package:flutter/material.dart';

class CustomBirthdayDropdownButton extends StatelessWidget {
  const CustomBirthdayDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // Hint label
      hint: Text(
        "Day",
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
        suffixIconConstraints: BoxConstraints(
          minWidth: 22.0,
        ),
        errorStyle: TextStyle(
          color: Color(0xFFefb744),
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
        ),
        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
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
          borderSide: BorderSide(
            color: Colors.transparent,
          ), // error state
        ),
        focusedErrorBorder:
        OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      items:
      List.generate(
        31,
            (index) => "${index + 1}",
      )
          .map(
            (day) => DropdownMenuItem(
          value: day,
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black45,
              fontWeight:
              FontWeight.w500,
            ),
          ),
        ),
      )
          .toList(),
      onChanged: (String? selectedDay) {
        print("Selected day: $selectedDay");
      },
    );
  }
}