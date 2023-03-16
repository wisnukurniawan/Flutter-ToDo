import 'package:flutter_todo_list/entity/todo_task.dart';
import 'package:flutter_todo_list/foundation/utils/todo_task_parser.dart';

import 'local/todo_task_provider.dart';

class ToDoTaskRepository {
  final ToDoTaskProvider _toDoTaskProvider;

  const ToDoTaskRepository(this._toDoTaskProvider);

  Future<void> insertToDoTasks(List<ToDoTask> toDoTasks, String listId) async {
    final values =
        toDoTasks.map((toDoTask) => toDoTask.toMap(listId)).toList();
    _toDoTaskProvider.insertToDoTasks(values);
  }

  Future<void> updateToDoTaskStatus(
      ToDoTask toDoTask, String id) async {
    final value = toDoTask.toStatusMap(id);
    _toDoTaskProvider.updateToDoTask(value, id);
  }

  Future<void> deleteToDoTask(String id) async {
    _toDoTaskProvider.deleteToDoTask(id);
  }

}
