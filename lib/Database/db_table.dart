import 'package:signin_and_signup_screens/Class%20Model/user_model.dart';
import 'package:signin_and_signup_screens/Database/database_service.dart';
import 'package:sqflite/sqflite.dart';

class DBTable {
  // table name
  final String tableName = 'user';

  // column names
  final String id = 'id';
  final String fullName = 'fullName';
  final String emailId = 'emailId';
  final String userName = 'userName';
  final String birthday = 'birthday';
  final String password = 'password';
  final String phoneNo = 'phoneNumber';
  final String secuQue = 'securityQuestion';
  final String secuAns = 'securityAnswer';

  /// Method that create table in database
  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
      "$id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "$fullName" TEXT NOT NULL,
      "$emailId" TEXT NOT NULL,
      "$userName" TEXT NOT NULL,
      "$birthday" TEXT NOT NULL,
      "$password" TEXT NOT NULL,
      "$phoneNo" TEXT NOT NULL,
      "$secuQue" TEXT NOT NULL,
      "$secuAns" TEXT NOT NULL
      );
      ''');
  }

  /// Method to insert user data
  Future<void> insertUser(UserModel user) async {
    final db = await DatabaseService().database;
    await db.insert(tableName, user.toMap());
  }

  /// Method to read/ fetch users list
  Future<List<UserModel>> getUsersList() async {
    final db = await DatabaseService().database;
    List usersList = await db.query(tableName);
    return usersList.map((element) => UserModel.fromMap(element)).toList();
  }

  /// Method to update user data
  Future<void> updateUserData(UserModel user) async {
    final db = await DatabaseService().database;
    await db.update(
      tableName,
      user.toMap(),
      where: '$id = ?',
      whereArgs: [user.id],
    );
  }

  /// Method to delete user data from table
  Future<bool> deleteUser(int id) async {
    final db = await DatabaseService().database;
    int rowEffected = await db.delete(
      tableName,
      where: '$id = ?',
      whereArgs: [id],
    );
    return rowEffected > 0;
  }
}
