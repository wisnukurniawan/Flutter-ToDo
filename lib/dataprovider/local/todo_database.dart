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
      await db.execute("CREATE TABLE IF NOT EXISTS `todo_list` ("
          "`id` TEXT NOT NULL, "
          "`name` TEXT NOT NULL, "
          "`created_at` INTEGER NOT NULL, "
          "`updated_at` INTEGER NOT NULL, "
          "PRIMARY KEY(`id`))");
      await db.execute("CREATE TABLE IF NOT EXISTS `todo_task` ("
          "`id` TEXT NOT NULL, "
          "`name` TEXT NOT NULL, "
          "`list_id` TEXT NOT NULL, "
          "`status` TEXT NOT NULL, "
          "`completed_at` INTEGER, "
          "`created_at` INTEGER NOT NULL, "
          "`updated_at` INTEGER NOT NULL, "
          "PRIMARY KEY(`id`), "
          "FOREIGN KEY(`list_id`) REFERENCES `todo_list`(`id`) "
          "ON UPDATE NO ACTION ON DELETE CASCADE )");
      await db.execute("CREATE INDEX IF NOT EXISTS `index_todo_task_list_id` "
          "ON `todo_task` (`list_id`)");
    });
  }
}
