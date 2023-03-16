import 'package:flutter_todo_list/dataprovider/local/todo_provider.dart';
import 'package:sqflite/sqflite.dart';

class ToDoTaskProvider extends ToDoProvider {

  const ToDoTaskProvider(super.database);

  Future<void> insertToDoTasks(List<Map<String, Object?>> values) async {
    final batch = database.batch();
    for (var value in values) {
      batch.insert(
        'todo_tasks',
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<void> updateToDoTask(
      Map<String, Object?> value, String id) async {
    await database.update(
      'todo_tasks',
      value,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteToDoTask(String id) async {
    await database.delete(
      'todo_tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
