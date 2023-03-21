import 'package:flutter_todo_list/data_provider/utils/date_time_converter.dart';
import 'package:flutter_todo_list/data_provider/utils/todo_list_parser.dart';
import 'package:flutter_todo_list/entity/todo_list.dart';

import 'local/todo_list_provider.dart';

class ToDoListRepository {
  const ToDoListRepository(this._toDoListProvider);

  final ToDoListProvider _toDoListProvider;

  Future deleteToDoList(String id) async {
    _toDoListProvider.deleteToDoList(id);
  }

  Future insertToDoLists(List<ToDoList> toDoLists) async {
    final values = toDoLists.map((toDoList) => toDoList.toMap()).toList();
    _toDoListProvider.insertToDoLists(values);
  }

  Future updateToDoListName(ToDoList toDoList) async {
    _toDoListProvider.updateToDoListName(
        toDoList.id, toDoList.name, toDoList.updatedAt.toMillis());
  }

  Stream<List<ToDoList>> getAllToDoLists() {
    return _toDoListProvider
        .getAllToDoLists()
        .map((values) => values.map((item) => toToDoList(item)).toList());
  }

  Stream<ToDoList> getToDoList(String id) {
    return _toDoListProvider
        .getToDoListWithTaskById(id)
        .where((event) => event.isNotEmpty)
        .map((event) => toToDoListWithTasksDrift(event));
  }
}
