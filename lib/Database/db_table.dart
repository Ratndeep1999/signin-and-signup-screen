import 'package:signin_and_signup_screens/Database/database_service.dart';
import 'package:sqflite/sqflite.dart';

class DBTable {
  /// Configure Database Table and Columns
  static const String _kUsersTable = 'users_table';
  static const String kId = "users_id";
  static const String kFullName = 'full_name';
  static const String kEmailId = 'email_id';
  static const String kUserName = 'user_name';
  static const String kBirthday = 'birthday';
  static const String kPassword = 'password';
  static const String kPhoneNo = 'phone_number';
  static const String kSecurityQue = 'security_question';
  static const String kSecurityAns = 'security_answer';

  /// Create Table in Database
  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $_kUsersTable (
      "$kId" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      "$kFullName" TEXT NOT NULL,
      "$kEmailId" TEXT NOT NULL,
      "$kUserName" TEXT NOT NULL,
      "$kBirthday" TEXT NOT NULL,
      "$kPassword" TEXT NOT NULL,
      "$kPhoneNo" TEXT NOT NULL,
      "$kSecurityQue" TEXT NOT NULL,
      "$kSecurityAns" TEXT NOT NULL
      );
      ''');
  }

  /// Database migrations (future use)
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // handle migrations here
  }

  /// Create User to Database
  Future<bool> insertUser({
    required String fullName,
    required String email,
    required String userName,
    required String birthday,
    required String phoneNo,
    required String securityQue,
    required String securityAns,
    required String password,
  }) async {
    final db = await DatabaseService().database;
    int user = await db.insert(_kUsersTable, {
      kFullName: fullName,
      kEmailId: email,
      kUserName: userName,
      kBirthday: birthday,
      kPhoneNo: phoneNo,
      kSecurityQue: securityQue,
      kSecurityAns: securityAns,
      kPassword: password,
    }, conflictAlgorithm: ConflictAlgorithm.abort);
    return (user > 0);
  }

  /// Read Users from Database
  Future<List<Map<String, Object?>>> getUsersList() async {
    final db = await DatabaseService().database;
    final List<Map<String, Object?>> usersList = await db.query(_kUsersTable);
    return usersList;
  }

  /// Update User Data in Database
  Future<bool> updateUserData({
    required int id,
    required String fullName,
    required String email,
    required String userName,
    required String birthday,
    required String phoneNo,
  }) async {
    final db = await DatabaseService().database;
    int user = await db.update(
      _kUsersTable,
      {
        kFullName: fullName,
        kEmailId: email,
        kUserName: userName,
        kBirthday: birthday,
        kPhoneNo: phoneNo,
      },
      where: '$kId = ?',
      whereArgs: [id],
    );
    return (user > 0);
  }

  /// Delete User from Database
  Future<bool> deleteUser({required int id}) async {
    final db = await DatabaseService().database;
    int user = await db.delete(
      _kUsersTable,
      where: '$kId = ?',
      whereArgs: [id],
    );
    return (user > 0);
  }

  /// Check User Data to Login User
  Future<Map<String, Object?>?> loginUser({
    required String emailOrUsername,
    required String password,
  }) async {
    final db = await DatabaseService().database;
    final result = await db.query(
      _kUsersTable,
      where: '$kEmailId = ? OR $kUserName = ?',
      whereArgs: [emailOrUsername, emailOrUsername],
      limit: 1,
    );
    if (result.isEmpty) return null;
    final user = result.first;

    if (user[kPassword] != password) return null;
    return user;
  }

  /// Close Database
  Future<void> closeDatabase() async {
    final db = await DatabaseService().database;
    if (db != null) {
      await db.close();
    }
  }
}
