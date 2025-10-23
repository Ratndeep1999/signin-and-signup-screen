import 'package:flutter/material.dart';

class CustomSecurityQuestionField extends StatelessWidget {
  const CustomSecurityQuestionField({
    super.key,
    required this.securityQuestions,
    required this.onSaved,
  });

  final List<String> securityQuestions;
  final FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // hint text
      hint: Text(
        "example1234",
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
          size: 26,
          color: Colors.black45,
        ),
        suffixIconConstraints: BoxConstraints(minWidth: 68.0),
        // border-radius
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
        errorStyle: TextStyle(
          color: Color(0xFFefb744),
          fontSize: 10.0,
          fontWeight: FontWeight.bold,
        ),
        // padding of hintText
        contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0),
        // borders
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
      items: securityQuestions.map((question) {
        return DropdownMenuItem(
          value: question,
          child: Text(
            question,
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? securityQuestion) {
        //_selectedSecurityQuestion = securityQuestion;
      },
      onSaved: onSaved,
      validator: _securityQuestionValidation,
    );
  }

  /// Security Questin Validation
  String? _securityQuestionValidation(question) {
    if (question == null || question.isEmpty) {
      return "Please select the question";
    }
    return null;
  }
}
