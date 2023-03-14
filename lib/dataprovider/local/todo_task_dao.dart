import 'package:sqflite/sqflite.dart';

class ToDoTaskDao {
  final Database _database;

  const ToDoTaskDao(this._database);

  Future<void> insertToDoTasks(
      List<Map<String, Object?>> values, String listId) async {
    final batch = _database.batch();
    for (var value in values) {
      batch.insert(
        'todo_task',
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<void> updateToDoTaskStatus(
      String id, Map<String, Object?> value) async {
    await _database.update(
      'todo_task',
      value,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteToDoTask(String id) async {
    await _database.delete(
      'todo_task',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
