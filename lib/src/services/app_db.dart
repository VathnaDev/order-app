import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _appDatabase;
  static Database _db;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_appDatabase == null) {
      _appDatabase = DatabaseHelper._createInstance();
    }
    return _appDatabase;
  }

  Future<Database> get database async {
    if (_db == null) {
      _db = await initializedDatabse();
    }
    return _db;
  }

  Future<Database> initializedDatabse() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'order_app.db');

    var appDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
    return appDb;
  }

  void _createDatabase(Database db, int newVersion) async {
    final createTableCustomerQuery = """
      CREATE TABLE customers (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        gender BOOL,
        address TEXT,
        phone TEXT,
        createdDate TIMESTAMP,
        updatedDate TIMESTAMP
      )
    """;

    await db.execute(createTableCustomerQuery);
  }
  
}
