import 'package:path/path.dart';
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

  /// Method to create Database
  Future<Database> createDB() async {
    final path = join(await getDatabasesPath(), 'users.db');
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute();
      },
    );
    return database;
  }
}
