import 'package:sqflite/sqflite.dart';

class DatabaseService {
  /// Singleton pattern
  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  /// Database object
  Database? _database;

  /// Getter method to create Database If already exist then return






}
