import 'package:flutter/material.dart';

import 'custom_text_field_label.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SnackBar(
      content: CustomTextFieldLabel(label: 'Login....Please wait'),
      backgroundColor: Color(0xFFfeb64d),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
    );
  }
}
