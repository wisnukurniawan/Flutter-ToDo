import 'package:flutter_todo_list/entity/todo_task.dart';
import 'package:flutter_todo_list/foundation/utils/date_time_converter.dart';
import 'package:flutter_todo_list/foundation/utils/todo_task_parser.dart';

import 'local/todo_task_provider.dart';

class ToDoTaskRepository {
  final ToDoTaskProvider _toDoTaskProvider;

  const ToDoTaskRepository(this._toDoTaskProvider);

  Future<void> insertToDoTasks(List<ToDoTask> toDoTasks, String listId) async {
    final values = toDoTasks.map((toDoTask) => toDoTask.toMap(listId)).toList();
    _toDoTaskProvider.insertToDoTasks(values);
  }

  Future<void> updateToDoTaskStatus(ToDoTask toDoTask, String id) async {
    _toDoTaskProvider.updateToDoTaskStatus(
      id,
      toDoTask.status.name,
      toDoTask.completedAt?.toMillis(),
      toDoTask.updatedAt.toMillis(),
    );
  }

  Future<void> deleteToDoTask(String id) async {
    _toDoTaskProvider.deleteToDoTask(id);
  }
}
