import 'package:flutter_todo_list/entity/todo_list.dart';
import 'package:flutter_todo_list/usecase/date_time_converter.dart';

extension ToDoListParserExtension on ToDoList {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toMillis,
      'updated_at': updatedAt.toMillis,
    };
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
