import 'package:path/path.dart';
import 'package:signin_and_signup_screens/Database/db_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  /// Singleton Pattern
  // static single instance
  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal(); // private constructor

  factory DatabaseService() => _instance; // return single instance

  /// Database Object
  static Database? _database;

  /// Database Config
  static const String _dbName = 'users.db';
  static const int _dbVersion = 1;

  /// Return Database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _createDB();
    return _database!;
  }

  /// Database Path
  Future<String> get _dbPath async {
    final dbPath = await getDatabasesPath();
    return join(dbPath, _dbName);
  }

  /// Create Database
  Future<Database> _createDB() async {
    final path = await _dbPath;
    Database database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      singleInstance: true,
    );
    return database;
  }

  /// Create Database Table
  Future<void> _onCreate(Database database, int version) async {
    return await DBTable().createTable(database);
  }
}
