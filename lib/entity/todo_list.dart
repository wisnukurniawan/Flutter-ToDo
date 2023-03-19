import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'todo_task.dart';

@immutable
class ToDoList {
  const ToDoList(
      {required this.id,
      required this.name,
      this.tasks = const [],
      required this.createdAt,
      required this.updatedAt});

  final String id;
  final String name;
  final List<ToDoTask> tasks;
  final DateTime createdAt;
  final DateTime updatedAt;

  ToDoList copyWith({
    String? id,
    String? name,
    List<ToDoTask>? tasks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ToDoList(
      id: id ?? this.id,
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'ToDoList{id: $id, name: $name, tasks: $tasks, createdAt: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt)}, updatedAt: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedAt)}}';
  }
}
