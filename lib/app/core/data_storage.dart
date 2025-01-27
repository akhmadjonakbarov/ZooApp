import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zoo_app/app/features/note/models/note.dart';

class DataStorage {
  static const String _tableName = 'notes';

  // Singleton instance
  static final DataStorage _instance = DataStorage._internal();

  factory DataStorage() => _instance;

  // Private constructor
  DataStorage._internal();

  // Database instance
  Database? _database;

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            text TEXT,
            images TEXT,
            created TEXT
          )
        ''');
      },
    );
  }

  // Insert data
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert(
      _tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve data
  Future<List<Note>> getNotes() async {
    Database db = await database;
    List<Map<String, Object?>> maps = await db.query(_tableName);
    return maps.map((map) => Note.fromMap(map)).toList();
  }

  // Delete data
  Future<void> deleteResult(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
