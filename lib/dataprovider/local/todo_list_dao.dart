import 'package:sqflite/sqflite.dart';

class ToDoListDao {
  final Database _database;

  const ToDoListDao(this._database);

  Future<void> deleteToDoList(String id) async {
    await _database.delete(
      'todo_list',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertToDoLists(List<Map<String, Object?>> values) async {
    final batch = _database.batch();
    for (var value in values) {
      batch.insert(
        'todo_list',
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<List<Map<String, Object?>>> getAllToDoLists() async {
    final result = await _database.query('todo_list');
    return result;
  }

  Future<List<Map<String, Object?>>> getToDoList(String id) async {
    final db = _database;
    final result = await db.query(
      'todo_list',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }
}
