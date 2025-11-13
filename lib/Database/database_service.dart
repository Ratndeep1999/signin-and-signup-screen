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






}
