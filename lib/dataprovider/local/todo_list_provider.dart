import 'package:drift/drift.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_database.dart';

class ToDoListProvider {
  final ToDoDatabase _database;

  const ToDoListProvider(this._database);

  Future deleteToDoList(String id) {
    return (_database.delete(_database.todoLists)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<void> insertToDoLists(List<Map<String, dynamic>> values) async {
    await _database.batch((batch) {
      batch.insertAllOnConflictUpdate(
          _database.todoLists, values.map((data) => TodoList.fromJson(data)));
    });
  }

  Future updateToDoListName(String id, String name, int updatedAt) {
    return (_database.update(_database.todoLists)
          ..where((tbl) => tbl.id.equals(id)))
        .write(
      TodoListsCompanion(name: Value(name), updatedAt: Value(updatedAt)),
    );
  }

  Stream<List<Map<String, dynamic>>> getAllToDoLists() {
    return (_database.select(_database.todoLists))
        .map((data) => data.toJson())
        .watch();
  }

  Stream<List<GetAllListWithTaskByIdResult>> getToDoListWithTaskById(String id) {
    return _database.getAllListWithTaskById(id).watch();
  }
}
