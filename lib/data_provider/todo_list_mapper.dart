import 'package:flutter_todo_list/utils/date_time_converter.dart';
import 'package:flutter_todo_list/data_provider/todo_task_mapper.dart';
import 'package:flutter_todo_list/entity/todo_list.dart';

import 'local/todo_database.dart';

class ToDoListMapper {
  static ToDoList toToDoList(Map<String, dynamic> map) {
    return ToDoList(
      id: map['id'],
      name: map['name'],
      createdAt: (map['created_at'] as int).toDateTime(),
      updatedAt: (map['updated_at'] as int).toDateTime(),
    );
  }

  static ToDoList toToDoListWithTasks(List<Map<String, dynamic>> maps) {
    return maps.fold<ToDoList>(toToDoList(maps.first), (prev, element) {
      if (element['task_id'] != null) {
        final toDoTask = ToDoTaskMapper.toToDoTaskAlias(element);
        final newTasks = List.of(prev.tasks)..add(toDoTask);
        prev = prev.copyWith(tasks: newTasks);
      }
      return prev;
    });
  }

  static ToDoList toToDoListWithTasksDrift(
      List<GetAllListWithTaskByIdResult> maps) {
    return maps.fold<ToDoList>(toToDoListDrift(maps.first), (prev, element) {
      if (element.taskId != null) {
        final toDoTask = ToDoTaskMapper.toToDoTaskAliasDrift(element);
        final newTasks = List.of(prev.tasks)..add(toDoTask);
        prev = prev.copyWith(tasks: newTasks);
      }
      return prev;
    });
  }

  static ToDoList toToDoListDrift(GetAllListWithTaskByIdResult result) {
    return ToDoList(
      id: result.id,
      name: result.name,
      createdAt: result.createdAt.toDateTime(),
      updatedAt: result.updatedAt.toDateTime(),
    );
  }

  static Map<String, dynamic> toNameMap(ToDoList toDoList) {
    return {'name': toDoList.name, 'updated_at': toDoList.updatedAt.toMillis()};
  }

  static Map<String, dynamic> toMap(ToDoList toDoList) {
    return {
      'id': toDoList.id,
      'name': toDoList.name,
      'created_at': toDoList.createdAt.toMillis(),
      'updated_at': toDoList.updatedAt.toMillis(),
    };
  }
}
