import 'package:flutter_todo_list/dataprovider/local/todo_list_query.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_task_query.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const todoDbName = "todo.db";

class ToDoDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await openDb();
    return _database!;
  }

  Future openDb() async {
    return await openDatabase(join(await getDatabasesPath(), todoDbName),
        version: 1,
        onOpen: (db) async {}, onCreate: (Database db, int version) async {
      // Create all tables
      await db.execute(createToDoListTable);
      await db.execute(createToDoTaskTable);
      await db.execute(createToDoTaskIndexTable);
    });
  }
}
