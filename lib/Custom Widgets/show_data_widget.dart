import 'package:flutter/material.dart';

class ShowDataWidget extends StatelessWidget {
  const ShowDataWidget({
    super.key,
    required this.isVisible,
    required this.value,
  });

  final bool isVisible;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        isVisible ? value : '**********',
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
