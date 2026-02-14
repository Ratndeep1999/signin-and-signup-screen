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
  SharedPreferencesServices prefServices = SharedPreferencesServices();
  final DBTable dbService = DBTable();

  late Future<List<Map<String, Object?>>> usersList;

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
      print("User deleted successfully");
      _loadUserList();
    } else {
      print("No user found with id = $id");
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
            onPressed: () => _logout,
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
                child: FutureBuilder<List<Map<String, Object?>>>(
                  future: usersList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final users = snapshot.data ?? [];

                    if (users.isEmpty) {
                      return Center(
                        child: Text(
                          'No users found',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        // Separate User
                        final user = users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(user[DBTable.kId].toString()),
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: IconButton(
                                onPressed: () =>
                                    _deleteUser(user[DBTable.kId] as int),
                                icon: Icon(Icons.delete, size: 20.0),
                              ),
                            ),
                            title: Text(
                              user[DBTable.kFullName].toString(),
                              style: TextStyle(fontSize: 12.0),
                            ),
                            subtitle: Text(
                              user[DBTable.kBirthday].toString(),
                              style: TextStyle(fontSize: 12.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                        );
                      },
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
  void _loadUserList() {
    setState(() => usersList = dbService.getUsersList());
    debugPrint(usersList.toString());
  }
}
