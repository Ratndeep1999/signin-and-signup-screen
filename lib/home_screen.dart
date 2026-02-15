import 'dart:async';
import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';
import 'package:signin_and_signup_screens/signin_screen.dart';
import 'Custom Widgets/custom_clipping_design.dart';
import 'Custom Widgets/custom_text_field_label.dart';
import 'Shared Preferences/shared_preferences_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferencesServices prefServices = SharedPreferencesServices();
  final DBTable dbService = DBTable();

  List<Map<String, Object?>> usersList = [];

  @override
  void initState() {
    super.initState();
    _loadUserList();
  }

  /// Delete user
  void _deleteUser(int id) async {
    final isUserDelete = await dbService.deleteUser(id: id);
    if (!mounted) return;

    if (isUserDelete) {
      _loadUserList();
    } else {
      debugPrint("No user found with id = $id");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFefb744),
        title: Text(
          "Users Database",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: Icon(Icons.logout_outlined, semanticLabel: "Logout"),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 20.0),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Background Custom Design
            const CustomClippingDesign(),

            /// Card
            SizedBox(
              width: double.infinity,
              height: 680.0,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                elevation: 5.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 18.0,
                  ),
                  shrinkWrap: true,
                  itemCount: usersList.length,
                  itemBuilder: (_, index) {
                    // Separate User
                    final user = usersList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade400,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              /// Item index
                              CircleAvatar(
                                backgroundColor: Colors.black12,
                                child: Text("${index + 1}"),
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
                                      user[DBTable.kFullName].toString(),
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    /// Email
                                    Text(user[DBTable.kEmailId].toString()),

                                    /// Username
                                    Text(user[DBTable.kUserName].toString()),

                                    /// DOB
                                    Text(user[DBTable.kBirthday].toString()),

                                    /// Phone Number
                                    Text(user[DBTable.kPhoneNo].toString()),
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
                                    backgroundColor: Colors.black12,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit, size: 16.0),
                                    ),
                                  ),

                                  /// Delete
                                  CircleAvatar(
                                    backgroundColor: Colors.black12,
                                    radius: 16,
                                    child: IconButton(
                                      onPressed: () =>
                                          _deleteUser(user[DBTable.kId] as int),
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigate to Signing Screen
  void _logout(BuildContext context) {
    prefServices.clearLoginData(); // Remove key
    _showSnackBar(label: 'Logout', context: context);
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => SigningScreen()));
  }

  /// SnackBar Method
  void _showSnackBar({required String label, context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextFieldLabel(label: label, labelFontSize: 15.0),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFFfeb64d),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
      ),
    );
  }

  /// Insert User into usersList
  Future<void> _loadUserList() async {
    final users = await dbService.getUsersList();
    setState(() => usersList = users);
  }
}
