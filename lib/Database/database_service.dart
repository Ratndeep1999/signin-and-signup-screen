import 'package:path/path.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  /// Singleton pattern
  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  /// Database object
  Database? _database;

  /// Getter method to create Database If Database already exists then return
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database == await createDB();
    return _database!;
  }

  /// Method that return path of database
  Future<String> get fullPath async {
    // database name
    const String dbName = 'users.db';
    // path
    final path = await getDatabasesPath();

    return join(path, dbName);
  }

  /// Method to create Database
  Future<Database> createDB() async {
    // get full path
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> _create(Database database, int version) async =>
      await DBTable().createTable(database);
}
