import 'package:meta/meta.dart';

@immutable
class ToDoTask {
  final String id;
  final String name;
  final bool isCompleted;

  const ToDoTask(
      {required this.id, required this.name, this.isCompleted = false});

  ToDoTask copyWith({
    String? id,
    String? name,
    bool? isCompleted,
  }) {
    return ToDoTask(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'ToDoTask{id: $id, name: $name, isCompleted: $isCompleted}';
  }
}
