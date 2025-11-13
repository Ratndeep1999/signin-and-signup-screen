import 'dart:async';
import 'package:flutter/material.dart';
import 'package:signin_and_signup_screens/Class%20Model/user_model.dart';
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

  /// dbTables object
  final DBTable dbService = DBTable();
  /// variable that holds users list
 late Future<List<UserModel>> usersList;

  @override
  void initState() {
    super.initState();
    loadUserList();
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
            onPressed: () {
              _showSnackBar(label: 'Logout', context: context);
              _logout(context);
            },
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

            SizedBox(
              width: double.infinity,
              height: 650.0,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                elevation: 5.0,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Text("1")),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              /// Edit Icon
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit, size: 20.0),
                              ),

                              /// Delete Icon
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, size: 20.0),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          "Ratndeep Chandankhede",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        subtitle: Text(
                          "06 Feb 1999",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.black),
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
  void _logout(context) {
    // Clear all Stored Shared Pref Data
    _clearStoredPrefData();

    // Delay 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigningScreen()),
      );
    });
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

  /// It Cleared All Stored Data
  void _clearStoredPrefData() async {
    SharedPreferencesServices prefServices = SharedPreferencesServices();
    prefServices.clearPrefData();
  }

  void loadUserList() {
    usersList = dbService.getUsersList();
  }
}
