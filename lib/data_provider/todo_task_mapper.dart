import 'package:flutter_todo_list/foundation/utils/date_time_converter.dart';
import 'package:flutter_todo_list/entity/todo_status.dart';

import 'local/todo_database.dart';
import '../entity/todo_task.dart';

class ToDoTaskMapper {
  static ToDoTask toToDoTask(Map<String, dynamic> map) {
    return ToDoTask(
        id: map['id'],
        name: map['name'],
        status: ToDoStatus.values.byName(map['status']),
        completedAt: map['completed_at'] != null
            ? (map['completed_at'] as int).toDateTime()
            : null,
        createdAt: (map['created_at'] as int).toDateTime(),
        updatedAt: (map['updated_at'] as int).toDateTime());
  }

  static ToDoTask toToDoTaskAlias(Map<String, dynamic> map) {
    return ToDoTask(
        id: map['task_id'],
        name: map['task_name'],
        status: ToDoStatus.values.byName(map['task_status']),
        completedAt: map['task_completed_at'] != null
            ? (map['task_completed_at'] as int).toDateTime()
            : null,
        createdAt: (map['task_created_at'] as int).toDateTime(),
        updatedAt: (map['task_updated_at'] as int).toDateTime());
  }

  static ToDoTask toToDoTaskAliasDrift(GetAllListWithTaskByIdResult result) {
    return ToDoTask(
        id: result.taskId ?? "",
        name: result.taskName ?? "",
        status: ToDoStatus.values
            .byName(result.taskStatus ?? ToDoStatus.inProgress.name),
        completedAt: result.taskCompletedAt?.toDateTime(),
        createdAt: result.taskCreatedAt?.toDateTime() ?? DateTime.now(),
        updatedAt: result.taskUpdatedAt?.toDateTime() ?? DateTime.now());
  }

  static Map<String, dynamic> toMap(ToDoTask toDoTask, String listId) {
    return {
      'id': toDoTask.id,
      'name': toDoTask.name,
      'list_id': listId,
      'status': toDoTask.status.name,
      'completed_at': toDoTask.completedAt?.toMillis(),
      'created_at': toDoTask.createdAt.toMillis(),
      'updated_at': toDoTask.updatedAt.toMillis(),
    };
  }

  static Map<String, dynamic> toStatusMap(ToDoTask toDoTask, String listId) {
    return {
      'status': toDoTask.status.name,
      'completed_at': toDoTask.completedAt?.toMillis(),
      'updated_at': toDoTask.updatedAt.toMillis()
    };
  }
}
