import 'package:flutter_todo_list/foundation/utils/date_time_converter.dart';
import 'package:flutter_todo_list/data_provider/mapper/todo_list_mapper.dart';
import 'package:flutter_todo_list/entity/todo_list.dart';

import '../local/todo_list_provider.dart';

class ToDoListRepository {
  ToDoListRepository(this._toDoListProvider);

  final ToDoListProvider _toDoListProvider;

  Future deleteToDoList(String id) {
    return _toDoListProvider.deleteToDoList(id);
  }

  Future insertToDoLists(List<ToDoList> toDoLists) async {
    final values =
        toDoLists.map((toDoList) => ToDoListMapper.toMap(toDoList)).toList();
    _toDoListProvider.insertToDoLists(values);
  }

  Future updateToDoListName(ToDoList toDoList) {
    return _toDoListProvider.updateToDoListName(
        toDoList.id, toDoList.name, toDoList.updatedAt.toMillis());
  }

  Stream<List<ToDoList>> getAllToDoLists() {
    return _toDoListProvider.getAllToDoLists().map((values) =>
        values.map((item) => ToDoListMapper.toToDoList(item)).toList());
  }

  Stream<ToDoList> getToDoList(String id) {
    return _toDoListProvider
        .getToDoListWithTaskById(id)
        .where((event) => event.isNotEmpty)
        .map((event) => ToDoListMapper.toToDoListWithTasksDrift(event));
  }
}
