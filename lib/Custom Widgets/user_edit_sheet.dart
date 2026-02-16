import 'package:flutter/material.dart';

import '../Database/db_table.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'custom_text_field_label.dart';

class UserEditSheet extends StatefulWidget {
  const UserEditSheet({
    super.key,
    required this.id,
    required this.fillName,
    required this.email,
    required this.userName,
    required this.birthdate,
    required this.phNumber,
    required this.updateUser,
  });

  final int id;
  final String fillName;
  final String email;
  final String userName;
  final String birthdate;
  final String phNumber;
  final VoidCallback updateUser;

  @override
  State<UserEditSheet> createState() => _UserEditSheetState();
}

class _UserEditSheetState extends State<UserEditSheet> {
  final DBTable dbService = DBTable();
  late final TextEditingController _fullName;
  late final TextEditingController _email;
  late final TextEditingController _userName;
  late final TextEditingController _birthdate;
  late final TextEditingController _phNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fullName = TextEditingController(text: widget.fillName);
    _email = TextEditingController(text: widget.email);
    _userName = TextEditingController(text: widget.userName);
    _birthdate = TextEditingController(text: widget.birthdate);
    _phNumber = TextEditingController(text: widget.phNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFieldLabel(
                label: 'Edit your details',
                labelFontSize: 18.0,
              ),
              const SizedBox(height: 20.0),

              /// Full Name
              CustomTextField(
                hintText: 'Full Name',
                keyboardType: TextInputType.name,
                controller: _fullName,
                validation: _fullNameValidation,
                textInputAction: TextInputAction.next,
                autofillHints: [AutofillHints.givenName],
                topPadding: 12.0,
                bottomPadding: 12.0,
                leftPadding: 20.0,
                hintTextFontSize: 13.0,
              ),
              SizedBox(height: 18.0),

              /// Email
              CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                validation: _emailValidation,
                textInputAction: TextInputAction.next,
                autofillHints: [AutofillHints.givenName],
                topPadding: 12.0,
                bottomPadding: 12.0,
                leftPadding: 20.0,
                hintTextFontSize: 13.0,
              ),
              SizedBox(height: 18.0),

              /// Username
              CustomTextField(
                hintText: 'User Name',
                keyboardType: TextInputType.name,
                controller: _userName,
                validation: _userNameValidation,
                textInputAction: TextInputAction.next,
                autofillHints: [AutofillHints.givenName],
                topPadding: 12.0,
                bottomPadding: 12.0,
                leftPadding: 20.0,
                hintTextFontSize: 13.0,
              ),
              SizedBox(height: 18.0),

              /// Save & Continue Button
              CustomButton(
                label: "Update Details",
                buttonPress: _updateUserDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Full Name Validation
  String? _fullNameValidation(String? fullName) {
    fullName = fullName?.trim();
    if (fullName == null || fullName.isEmpty) return 'Enter your full name';
    if (fullName.length < 2) return 'Name is too short';
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(fullName)) {
      return 'Please enter letters only';
    }
    return null;
  }

  /// Email Validation Method
  String? _emailValidation(String? email) {
    email = email?.trim().toLowerCase();
    if (email == null || email.isEmpty) return 'Please enter your email';
    if (email.contains(' ')) return 'Space is not allow';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      return "Email address must contain '@' and '.com'";
    }
    return null;
  }

  /// Username Validation
  String? _userNameValidation(String? userName) {
    userName = userName?.trim();
    if (userName == null || userName.isEmpty) {
      return 'Please enter your username';
    }
    if (userName.length < 4) return 'Username is too short';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(userName)) {
      return 'Only letters, numbers, and underscores are allowed';
    }
    // if (dbService..contains(userName)) {
    //   return 'Username is already taken';
    // }
    return null;
  }

  /// Update User Details
  void _updateUserDetails() {
    if (!_formKey.currentState!.validate()) return;

    dbService.updateUserData(
      id: widget.id,
      fullName: _fullName.text,
      email: _email.text,
      userName: _userName.text,
      birthday: _birthdate.text,
      phoneNo: _phNumber.text,
    );
    widget.updateUser();
    Navigator.pop(context);
  }
}
