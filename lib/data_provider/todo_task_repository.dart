import 'package:flutter_todo_list/utils/date_time_converter.dart';
import 'package:flutter_todo_list/data_provider/todo_task_mapper.dart';
import 'package:flutter_todo_list/entity/todo_task.dart';

import 'local/todo_task_provider.dart';

class ToDoTaskRepository {
  const ToDoTaskRepository(this._toDoTaskProvider);

  final ToDoTaskProvider _toDoTaskProvider;

  Future insertToDoTasks(List<ToDoTask> toDoTasks, String listId) async {
    final values = toDoTasks.map((toDoTask) => ToDoTaskMapper.toMap(toDoTask, listId)).toList();
    _toDoTaskProvider.insertToDoTasks(values);
  }

  Future updateToDoTaskStatus(ToDoTask toDoTask, String id) async {
    _toDoTaskProvider.updateToDoTaskStatus(
      id,
      toDoTask.status.name,
      toDoTask.completedAt?.toMillis(),
      toDoTask.updatedAt.toMillis(),
    );
  }

  Future deleteToDoTask(String id) async {
    _toDoTaskProvider.deleteToDoTask(id);
  }
}
