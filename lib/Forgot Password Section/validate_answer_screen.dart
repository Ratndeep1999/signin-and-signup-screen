import 'package:flutter/material.dart';

class ValidateAnswerScreen extends StatefulWidget {
  const ValidateAnswerScreen({super.key});

  @override
  State<ValidateAnswerScreen> createState() => _ValidateAnswerScreenState();
}

class _ValidateAnswerScreenState extends State<ValidateAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {},
          child: SafeArea(child: Column()),
        ),
      ),
    );
  }
}
