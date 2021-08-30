import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(
      String table, Map<String, Object?> data, int index) async {
    sql.Database db = await DBHelper.databaseToDo();
    if (index == 2) {
      db = await DBHelper.databaseScheduled();
    }
    if (index == 3) {
      db = await DBHelper.databaseRecurring();
    }
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<sql.Database> databaseToDo() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'routingeToDo.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE todo (id TEXT PRIMARY KEY, taskname TEXT, taskdesc TEXT, isOver TEXT)');
    }, version: 1);
  }

  static Future<sql.Database> databaseScheduled() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'routingerScheduled.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_scheduled(id INTEGER PRIMARY KEY, taskName TEXT, taskDesc TEXT, dateTime TEXT)');
    }, version: 1);
  }

  static Future<sql.Database> databaseRecurring() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'routingerRecurring.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_recurring(id INTEGER PRIMARY KEY, taskName TEXT, taskDesc TEXT, remindTime TEXT, notifInts TEXT)');
    }, version: 1);
  }

  Future<void> deleteDatabase(int index) async {
    final dbPath = await sql.getDatabasesPath();
    var finalPath = dbPath;
    if (index == 1) {
      finalPath = path.join(dbPath, 'routingerToDo.db');
    }
    if (index == 2) {
      finalPath = path.join(dbPath, 'routingerScheduled.db');
    }
    if (index == 3) {
      finalPath = path.join(dbPath, 'routingerRecurring.db');
    }
    await sql.databaseFactory.deleteDatabase(finalPath);
  }

  static Future<List<Map<String, dynamic>>> getData(
      String table, int index) async {
    sql.Database db;
    db = await DBHelper.databaseToDo();
    if (index == 2) {
      db = await DBHelper.databaseScheduled();
    }
    if (index == 3) {
      db = await DBHelper.databaseRecurring();
    }
    return db.query(table);
  }

  static Future<void> deleteToDo(String id) async {
    sql.Database db;
    db = await DBHelper.databaseToDo();
    await db.rawDelete('DELETE FROM todo WHERE id = ?', [id]);
  }

  static Future<void> updateIsOver(String id, bool isOver) async {
    sql.Database db;
    db = await DBHelper.databaseToDo();
    await db.rawUpdate(
        'UPDATE todo SET isOver = ? WHERE id = ?', [isOver.toString(), id]);
  }
}
