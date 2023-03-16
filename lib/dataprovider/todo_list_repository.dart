import 'package:collection/collection.dart';
import 'package:flutter_todo_list/entity/todo_list.dart';
import 'package:flutter_todo_list/foundation/utils/todo_list_parser.dart';

import 'local/todo_list_provider.dart';
import 'local/todo_list_query.dart';

class ToDoListRepository {
  final ToDoListProvider _toDoListProvider;

  const ToDoListRepository(this._toDoListProvider);

  Future<void> deleteToDoList(String id) async {
    _toDoListProvider.deleteToDoList(id);
  }

  Future<void> insertToDoLists(List<ToDoList> toDoLists) async {
    final values = toDoLists.map((toDoList) => toDoList.toMap()).toList();
    _toDoListProvider.insertToDoLists(values);
  }

  Future<void> updateToDoListName(ToDoList toDoList) async {
    final value = toDoList.toNameMap();
    _toDoListProvider.updateToDoList(value, toDoList.id);
  }

  Future<List<ToDoList>> getAllToDoLists() async {
    final result = await _toDoListProvider.getAllToDoLists();
    return result.whereNotNull().map((values) => toToDoList(values)).toList();
  }

  Future<ToDoList> getToDoList(String id) async {
    final result = await _toDoListProvider.rawQuery(queryToDoListWithTask);
    return toToDoListWithTasks(result);
  }
}
