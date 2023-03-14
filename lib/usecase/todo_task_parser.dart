import 'package:flutter_todo_list/entity/todo_status.dart';
import 'package:flutter_todo_list/usecase/date_time_converter.dart';

import '../entity/todo_task.dart';

extension ToDoTaskParserExtension on ToDoTask {
  Map<String, dynamic> toMap(String listId) {
    return {
      'id': id,
      'name': name,
      'list_id': listId,
      'status': status.toString(),
      'completed_at': completedAt?.toMillis,
      'created_at': createdAt.toMillis,
      'updated_at': updatedAt.toMillis,
    };
  }

  Map<String, dynamic> toUpdateStatusMap(String listId) {
    return {
      'status': status.toString(),
      'completed_at': completedAt?.toMillis,
      'updated_at': updatedAt.toMillis
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
