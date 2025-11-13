import 'package:sqflite/sqflite.dart';

class DBTable {

  // table name
  final String tableName = 'user';
  // column names
  final String id = 'id';
  final String firstName = 'First_Name';
  final String lastName = 'Last_Name';
  final String emailId = 'Email_Id';
  final String userName = 'User_Name';
  final String birthday = 'Birthday';
  final String password = 'Password';
  final String phoneNo = 'Phone_No';
  final String secuQue = 'Security_Que';
  final String secuAns = 'Security_Ans';

  /// Method that create table in database
  Future<void> createTable(Database database) async {
    await database.execute(
      '''
      CREATE TABLE IF NOT EXISTS $tableName (
      "$id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "$firstName" TEXT NOT NULL,
      "$lastName" TEXT NOT NULL,
      "$emailId" TEXT NOT NULL,
      "$userName" TEXT NOT NULL,
      "$birthday" TEXT NOT NULL,
      "$password" TEXT NOT NULL,
      "$phoneNo" TEXT NOT NULL,
      "$secuQue" TEXT NOT NULL,
      "$secuAns" TEXT NOT NULL,
      )
      '''
    );
  }

  /// Method to insert user data





}