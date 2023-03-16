import 'package:flutter_todo_list/dataprovider/local/todo_provider.dart';
import 'package:sqflite/sqflite.dart';

class ToDoListProvider extends ToDoProvider {

  const ToDoListProvider(super.database);

  Future<void> deleteToDoList(String id) async {
    await database.delete(
      'todo_lists',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertToDoLists(List<Map<String, Object?>> values) async {
    final batch = database.batch();
    for (var value in values) {
      batch.insert(
        'todo_lists',
        value,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<void> updateToDoList(
      Map<String, Object?> value, String id) async {
    await database.update(
      'todo_lists',
      value,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, Object?>>> getAllToDoLists() async {
    return await database.query('todo_lists');
  }

}
