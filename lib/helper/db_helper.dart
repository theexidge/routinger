//Third Party Imports
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  	static Future<void> insert(
      	String table, Map<String, Object?> data, int index) async {
    	sql.Database db = await DBHelper.database();
    	await db.insert(
      		table,
      		data,
      		conflictAlgorithm: sql.ConflictAlgorithm.replace,
    	);
  	}

	static Future<sql.Database> database() async {
		final dbPath = await sql.getDatabasesPath();
		return sql.openDatabase(path.join(dbPath, 'routinger'),
			onCreate: (db, version) async {
				await db.execute('CREATE TABLE todo (id TEXT PRIMARY KEY, taskname TEXT, taskdesc TEXT, isOver TEXT)');
				await db.execute('CREATE TABLE user_scheduled(id INTEGER PRIMARY KEY, taskName TEXT, taskDesc TEXT, dateTime TEXT, difficulty INTEGER)');
				await db.execute('CREATE TABLE user_recurring(id INTEGER PRIMARY KEY, taskName TEXT, taskDesc TEXT, remindTime TEXT, notifInts TEXT, difficulty INTEGER)');
				await db.execute('CREATE TABLE sleep_cycle(id INTEGER PRIMARY KEY, sleepTimeHour TEXT, sleepTimeMinute TEXT, wakeTimeHour TEXT, wakeTimeMinute Text)');
			}, version: 1);
	} 

	static Future<void> insertSleepCycle(
		String table, Map<String, Object?> data) async {
    	sql.Database db = await DBHelper.database();
    	await db.insert(table, data,
	        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  	static Future<void> deleteDatabase(int index) async {
    	final dbPath = await sql.getDatabasesPath();
    	var finalPath = path.join(dbPath, 'routinger.db');

    	await sql.databaseFactory.deleteDatabase(finalPath);
  	}

  	static Future<List<Map<String, dynamic>>> getData(
      	String table, int index) async {
    	sql.Database db;
    	db = await DBHelper.database();
    	return db.query(table);
  	}

  	static Future<List<Map<String, dynamic>>> getDataSleepCycle(
      	String table) async {
    	var db = await DBHelper.database();
    	return db.query(table);
  	}

  	static Future<void> deleteToDo(String id) async {
	    sql.Database db;
	    db = await DBHelper.database();
	    await db.rawDelete('DELETE FROM todo WHERE id = ?', [id]);
  	}

  	static Future<void> deleteScheduled(int id) async {
	    var db = await DBHelper.database();
	    await db.rawDelete('DELETE FROM user_scheduled WHERE id = ?', [id]);
  	}

  	static Future<void> deleteRecurring(int id) async {
	    var db = await DBHelper.database();
	    await db.rawDelete('DELETE FROM user_recurring WHERE id = ?', [id]);
  	}

  	static Future<void> updateIsOver(String id, bool isOver) async {
	    sql.Database db;
	    db = await DBHelper.database();
	    await db.rawUpdate('UPDATE todo SET isOver = ? WHERE id = ?', [isOver.toString(), id]);
	}
}
