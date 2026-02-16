import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.index, required this.userItem});
  final int index;
  final Map<String, dynamic> userItem;


  @override
  Widget build(BuildContext context) {
    final int userIndex = index + 1;
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
              CircleAvatar(
                backgroundColor: Color(0xFFefb744),
                child: Text("$userIndex"),
              ),

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

                    /// Email
                    Text(email),

                    /// Username
                    Text(userName),

                    /// DOB
                    Text(birthdate),

                    /// Phone Number
                    Text(phoneNo),
                  ],
                ),
              ),

              /// Edit and Delete Icon
              Column(
                spacing: 18.0,
                children: [
                  /// Edit
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFFefb744),
                    child: IconButton(
                      onPressed: () => _editUSer(
                        id: user[DBTable.kId] as int,
                        userName: user[DBTable.kUserName].toString(),
                        email: user[DBTable.kEmailId].toString(),
                        birthday: user[DBTable.kBirthday].toString(),
                        fullName: user[DBTable.kFullName].toString(),
                        phoneNo: user[DBTable.kPhoneNo].toString(),
                      ),
                      icon: Icon(Icons.edit, size: 16.0),
                    ),
                  ),

                  /// Delete
                  CircleAvatar(
                    backgroundColor: Color(0xFFefb744),
                    radius: 16,
                    child: IconButton(
                      onPressed: () => _deleteUser(user[DBTable.kId] as int),
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
