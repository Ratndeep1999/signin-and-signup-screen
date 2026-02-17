import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Custom%20Widgets/circular_button_widget.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.index,
    required this.userItem,
    required this.onEdit,
    required this.onDelete,
  });

  final int index;
  final Map<String, dynamic> userItem;
  final void Function({
    required int id,
    required String fullName,
    required String email,
    required String userName,
    required String birthdate,
    required String phoneNo,
  })
  onEdit;

  final void Function({required int id}) onDelete;

  @override
  Widget build(BuildContext context) {
    /// filter userItem
    final int userIndex = index + 1;
    final int id = userItem[DBTable.kId];
    final String fullName = userItem[DBTable.kFullName];
    final String email = userItem[DBTable.kEmailId];
    final String userName = userItem[DBTable.kUserName];
    final String birthdate = userItem[DBTable.kBirthday];
    final String phoneNo = userItem[DBTable.kPhoneNo];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.3),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// Item index
              CircularButtonWidget(child: Text("$userIndex")),

              /// User Data
              SizedBox(
                width: 180,
                child: Column(
                  spacing: 2.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Full Name
                    Text(
                      fullName,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(email),
                    Text(userName),
                    Text(birthdate),
                    Text(phoneNo),
                  ],
                ),
              ),

              /// Edit and Delete Icon
              Column(
                spacing: 18.0,
                children: [
                  /// Edit
                  CircularButtonWidget(
                    child: IconButton(
                      onPressed: () => onEdit(
                        id: id,
                        fullName: fullName,
                        email: email,
                        userName: userName,
                        birthdate: birthdate,
                        phoneNo: phoneNo,
                      ),
                      icon: Icon(Icons.edit, size: 16.0),
                    ),
                  ),

                  /// Delete
                  CircularButtonWidget(
                    child: IconButton(
                      onPressed: () => onDelete(id: id),
                      icon: Icon(Icons.delete, size: 16.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
