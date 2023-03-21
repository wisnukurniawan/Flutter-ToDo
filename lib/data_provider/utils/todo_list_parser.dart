import 'package:flutter_todo_list/data_provider/utils/date_time_converter.dart';
import 'package:flutter_todo_list/data_provider/utils/todo_task_parser.dart';
import 'package:flutter_todo_list/entity/todo_list.dart';

import '../../data_provider/local/todo_database.dart';

extension ToDoListParserExtension on ToDoList {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toMillis(),
      'updated_at': updatedAt.toMillis(),
    };
  }

  Map<String, dynamic> toNameMap() {
    return {'name': name, 'updated_at': updatedAt.toMillis()};
  }
}

ToDoList toToDoList(Map<String, dynamic> map) {
  return ToDoList(
    id: map['id'],
    name: map['name'],
    createdAt: (map['created_at'] as int).toDateTime(),
    updatedAt: (map['updated_at'] as int).toDateTime(),
  );
}

ToDoList toToDoListWithTasks(List<Map<String, dynamic>> maps) {
  return maps.fold<ToDoList>(toToDoList(maps.first), (prev, element) {
    if (element['task_id'] != null) {
      final toDoTask = toToDoTaskAlias(element);
      final newTasks = List.of(prev.tasks)..add(toDoTask);
      prev = prev.copyWith(tasks: newTasks);
    }
    return prev;
  });
}

ToDoList toToDoListDrift(GetAllListWithTaskByIdResult result) {
  return ToDoList(
    id: result.id,
    name: result.name,
    createdAt: result.createdAt.toDateTime(),
    updatedAt: result.updatedAt.toDateTime(),
  );
}

ToDoList toToDoListWithTasksDrift(List<GetAllListWithTaskByIdResult> maps) {
  return maps.fold<ToDoList>(toToDoListDrift(maps.first), (prev, element) {
    if (element.taskId != null) {
      final toDoTask = toToDoTaskAliasDrift(element);
      final newTasks = List.of(prev.tasks)..add(toDoTask);
      prev = prev.copyWith(tasks: newTasks);
    }
    return prev;
  });
}
