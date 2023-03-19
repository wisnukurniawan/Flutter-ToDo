import 'package:flutter_todo_list/entity/todo_status.dart';
import 'package:flutter_todo_list/foundation/utils/date_time_converter.dart';

import '../../data_provider/local/todo_database.dart';
import '../../entity/todo_task.dart';

extension ToDoTaskParserExtension on ToDoTask {
  Map<String, dynamic> toMap(String listId) {
    return {
      'id': id,
      'name': name,
      'list_id': listId,
      'status': status.name,
      'completed_at': completedAt?.toMillis(),
      'created_at': createdAt.toMillis(),
      'updated_at': updatedAt.toMillis(),
    };
  }

  Map<String, dynamic> toStatusMap(String listId) {
    return {
      'status': status.name,
      'completed_at': completedAt?.toMillis(),
      'updated_at': updatedAt.toMillis()
    };
  }
}

ToDoTask toToDoTask(Map<String, dynamic> map) {
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

ToDoTask toToDoTaskAlias(Map<String, dynamic> map) {
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

ToDoTask toToDoTaskAliasDrift(GetAllListWithTaskByIdResult result) {
  return ToDoTask(
      id: result.taskId ?? "",
      name: result.taskName ?? "",
      status: ToDoStatus.values
          .byName(result.taskStatus ?? ToDoStatus.inProgress.name),
      completedAt: result.taskCompletedAt?.toDateTime(),
      createdAt: result.taskCreatedAt?.toDateTime() ?? DateTime.now(),
      updatedAt: result.taskUpdatedAt?.toDateTime() ?? DateTime.now());
}
