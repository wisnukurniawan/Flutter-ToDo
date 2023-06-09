import 'package:drift/drift.dart';
import 'package:flutter_todo_list/data_provider/local/todo_database.dart';

class ToDoTaskProvider {
  const ToDoTaskProvider(this._database);

  final ToDoDatabase _database;

  Future insertToDoTasks(List<Map<String, Object?>> values) async {
    await _database.batch((batch) {
      batch.insertAllOnConflictUpdate(
          _database.todoTasks, values.map((data) => TodoTask.fromJson(data)));
    });
  }

  Future updateToDoTaskStatus(
      String id, String name, int? completedAt, int updatedAt) {
    return (_database.update(_database.todoTasks)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      TodoTasksCompanion(
        id: Value(id),
        name: Value(name),
        completedAt: Value(completedAt),
        updatedAt: Value(updatedAt),
      ),
    );
  }

  Future deleteToDoTask(String id) {
    return (_database.delete(_database.todoTasks)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
